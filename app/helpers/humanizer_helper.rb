# frozen_string_literal: true

module HumanizerHelper
  MAPPINGS = {
    first_singular: {
      subject: 'I',
      object: 'me',
      possessive: 'my',
      possessive_pronoun: 'mine',
      reflexive: 'myself',
      be: 'am',
      'be:past': 'was',
      do: 'do',
      have: 'have',
    },
    first_plural: {
      subject: 'we',
      object: 'us',
      possessive: 'our',
      possessive_pronoun: 'ours',
      reflexive: 'ourselves',
      be: 'are',
      'be:past': 'were',
      do: 'do',
      have: 'have',
    },
    second_singular: {
      subject: 'you',
      object: 'you',
      possessive: 'your',
      possessive_pronoun: 'yours',
      reflexive: 'yourself',
      be: 'are',
      'be:past': 'were',
      do: 'do',
      have: 'have',
      go: 'go',
    },
    second_plural: {
      subject: 'you all',
      object: 'you all',
      possessive: 'y\'all\'s',
      possessive_pronoun: 'y\'all\'s',
      reflexive: 'yourselves',
      be: 'are',
      'be:past': 'were',
      do: 'do',
      have: 'have',
      go: 'go',
    },
    third_singular_masculine: {
      subject: 'he',
      object: 'him',
      possessive: 'his',
      possessive_pronoun: 'his',
      reflexive: 'himself',
      be: 'is',
      'be:past': 'was',
      do: 'does',
      'do:past': 'did',
      have: 'has',
      go: 'goes',
    },
    third_singular_feminine: {
      subject: 'she',
      object: 'her',
      possessive: 'her',
      possessive_pronoun: 'hers',
      reflexive: 'herself',
      be: 'is',
      'be:past': 'was',
      do: 'does',
      'do:past': 'did',
      have: 'has',
      go: 'goes',
    },
    third_singular_neuter: {
      subject: 'it',
      object: 'it',
      possessive: 'its',
      possessive_pronoun: 'its',
      reflexive: 'itself',
      be: 'is',
      'be:past': 'was',
      do: 'does',
      'do:past': 'did',
      have: 'has',
      go: 'goes',
    },
    third_plural: {
      subject: 'they',
      object: 'them',
      possessive: 'their',
      possessive_pronoun: 'theirs',
      reflexive: 'themselves',
      be: 'are',
      'be:past': 'were',
      do: 'do',
      'do:past': 'did',
      have: 'have',
      go: 'go',
    },
  }.freeze

  def translate(template, person)
    return template if template.nil?

    translation = template.clone.to_s
    # Replace pronouns and possessive forms
    MAPPINGS[person].each do |placeholder, replacement|
      translation.gsub!("{{#{placeholder}}}", replacement)
    end

    # Conjugate verbs
    translation.gsub!(/\{\{verb:(\w+)\}\}/) do |match|
      verb_infinitive = ::Regexp.last_match(1)
      conjugate_verb(verb_infinitive, person)
    end

    translation
  end

  def escape_special_characters(str)
    str&.gsub('\"', '\\\"')
  end

  def conjugate_verb(verb, person)
    case person
    when :first_singular
      verb
    when :second_singular, :second_plural, :first_plural, :third_plural # rubocop:disable Lint/DuplicateBranch
      verb
    when :third_singular_masculine, :third_singular_feminine
      if verb.end_with?('y')
        "#{verb.chomp('y')}ies"
      elsif %w(ch s sh x z).any? { |suffix| verb.end_with?(suffix) }
        "#{verb}es"
      else
        "#{verb}s"
      end
    else # rubocop:disable Lint/DuplicateBranch
      verb
    end
  end
end
