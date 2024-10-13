# frozen_string_literal: true

module InitialStateHelper
  include Pundit::Authorization
  include InlineSvg::ActionView::Helpers
  include ERB::Util
  def initial_state(params = {})
    state_params = {
      settings: {},
      text: [params[:title], params[:text], params[:url]].compact.join(' '),
    }

    permit_visibilities = %w(public unlisted private direct)
    default_privacy     = current_account&.user&.setting_default_privacy
    permit_visibilities.shift(permit_visibilities.index(default_privacy) + 1) if default_privacy.present?
    state_params[:visibility] = params[:visibility] if permit_visibilities.include? params[:visibility]

    if user_signed_in? && current_user.functional?
      state_params[:settings]          = state_params[:settings].merge(Web::Setting.find_by(user: current_user)&.data || {})
      state_params[:push_subscription] = current_account.user.web_push_subscription(current_session)
      state_params[:current_account]   = current_account
      state_params[:token]             = current_session.token
      state_params[:admin]             = Account.find_local(Setting.site_contact_username.strip.gsub(/\A@/, ''))
    end

    if user_signed_in? && !current_user.functional?
      state_params[:disabled_account] = current_account
      state_params[:moved_to_account] = current_account.moved_to_account
    end

    state_params[:owner] = Account.local.without_suspended.without_internal.first if single_user_mode?

    json = ActiveModelSerializers::SerializableResource.new(InitialStatePresenter.new(state_params), serializer: InitialStateSerializer).to_json
    # rubocop:disable Rails/OutputSafety
    json_escape(json).html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
