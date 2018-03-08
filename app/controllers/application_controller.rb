class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  prepend_view_path Rails.root.join('frontend')

  rescue_from ActionController::RoutingError, with: :render_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def catch_404
    raise ActionController::RoutingError.new(params[:path]), 'route error'
  end

  private def render_not_found
    render template: 'shared/error', status: 404
  end

  private def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
