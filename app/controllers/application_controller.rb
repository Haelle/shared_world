class ApplicationController < ActionController::API
  class Unauthorized < RuntimeError; end

  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  rescue_from Unauthorized,                      with: :not_authorized
  before_action :set_raven_context

  protected

  def set_raven_context
    Raven.extra_context params: params.to_unsafe_h, url: request.url
  end

  def found_account
    @found_account ||= set_raven_user_and_get_account
  end

  def authorize_action_only_to_itself!
    raise Unauthorized unless @character.account == found_account
  end

  private

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  def set_raven_user_and_get_account
    Raven.user_context account_id: payload['account_id']
    Account.find payload['account_id']
  end
end
