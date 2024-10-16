# frozen_string_literal: true

class Account::Field < ActiveModelSerializers::Model
  include HumanizerHelper
  attr_accessor :name, :value, :verified_at

  MAX_CHARACTERS_LOCAL  = 255
  MAX_CHARACTERS_COMPAT = 2_047
  ACCEPTED_SCHEMES      = %w(https).freeze

  attributes :name, :value, :verified_at, :account, :display_value

  def initialize(account, attributes)
    # Keeping this as reference allows us to update the field on the account
    # from methods in this class, so that changes can be saved.
    @original_field = attributes
    @account        = account

    super(
      name: sanitize(attributes['name']),
      value: sanitize(attributes['value']),
      display_value: sanitize(attributes['display_value']).presence || sanitize(attributes['value']),
      verified_at: attributes['verified_at']&.to_datetime,
    )
  end

  def verified?
    verified_at.present?
  end

  def value_for_verification
    @value_for_verification ||= if account.local?
                                  value
                                else
                                  extract_url_from_html
                                end
  end

  def verifiable?
    return false if value_for_verification.blank?

    # This is slower than checking through a regular expression, but we
    # need to confirm that it's not an IDN domain.

    parsed_url = Addressable::URI.parse(value_for_verification)

    ACCEPTED_SCHEMES.include?(parsed_url.scheme) &&
      parsed_url.user.nil? &&
      parsed_url.password.nil? &&
      parsed_url.host.present? &&
      parsed_url.normalized_host == parsed_url.host &&
      (parsed_url.path.empty? || parsed_url.path == parsed_url.normalized_path)
  rescue Addressable::URI::InvalidURIError, IDN::Idna::IdnaError
    false
  end

  def requires_verification?
    !verified? && verifiable?
  end

  def mark_verified!
    @original_field['verified_at'] = self.verified_at = Time.now.utc
  end

  def to_h
    { name: name, value: value, verified_at: verified_at }
  end

  def mark_for_deletion
    @original_field['marked_for_deletion'] = true
  end

  def marked_for_deletion
    @original_field['marked_for_deletion'] == true unless @original_field['marked_for_deletion'].nil?
  end

  def third_person_masculine_display_value
    translate(display_value, :third_singular_masculine)
  end

  def second_person_singular_display_value
    translate(display_value, :second_singular)
  end

  def third_person_masculine_description
    translate(description, :third_singular_masculine)
  end

  def second_person_singular_description
    translate(description, :second_singular)
  end

  private

  def sanitize(str)
    str.strip[0, character_limit] unless str.nil?
  end

  def character_limit
    account.local? ? MAX_CHARACTERS_LOCAL : MAX_CHARACTERS_COMPAT
  end

  def extract_url_from_html
    doc = Nokogiri::HTML5.fragment(value)

    return if doc.nil?
    return if doc.children.size != 1

    element = doc.children.first

    return if element.name != 'a' || element['href'] != element.text

    element['href']
  end
end
