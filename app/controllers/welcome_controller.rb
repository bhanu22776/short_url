class WelcomeController < ApplicationController
  before_action :validate_url, only: [:create_url]
  include WelcomeHelper
  
  def index
  end

  def create_url
    if @is_valid
      @url = Url.new
      @url.short_url = SecureRandom.urlsafe_base64(5)
      @url.original_url = params[:url]
      @url.save
      @message = short_url(@url)
    else
      @message = "Invalid URL."
    end
  end

  def new_url
    @url = Url.find_by(short_url: params[:url])
    if @url.present?
      redirect_to @url.original_url
    else
      flash[:error] = "Invalid URL."
      redirect_to root_path
    end
  end

  private
  def validate_url
    if params[:url].present?
      begin
        uri = URI.parse(params[:url])
        resp = uri.kind_of?(URI::HTTP)
      rescue URI::InvalidURIError
        resp = false
      end
    else
      resp = false
    end
    @is_valid = resp
  end
end
