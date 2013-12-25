class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate, :load_videos

  def load_videos
    @videos = Video.find_all
  end

  protected

  def authenticate
    if Rails.env.staging?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["HTTP_USERNAME"] && password == ENV["HTTP_PASSWORD"]
      end
    end
  end

end
