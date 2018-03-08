class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  prepend_view_path Rails.root.join('frontend')

  rescue_from ActionController::RoutingError, with: :render_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def catch_404
    raise ActionController::RoutingError.new(params[:path]), 'route error'
  end

  private def render_not_found
    render template: 'shared/error', status: 404
  end
end
