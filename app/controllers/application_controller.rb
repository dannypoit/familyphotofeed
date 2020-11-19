class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize}", status: status
  end
end
