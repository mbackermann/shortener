class UrlsController < ApplicationController

  def create
    if params[:current_url].present?
      @url = Url.find_by(sanitize_url: Url.generate_sanitize_url(params[:current_url]))
    end
    if @url.nil?
      @url = Url.create!(url_params)
    end
    response_json({url: redirect_url(@url.short_url)}, :created)
  end

  def redirect
    @url = Url.find_by(short_url: params[:uuid])
    if @url.nil?
      raise ActiveRecord::RecordNotFound, 'URL not found'
    end
    @url.visited!
    redirect_to @url.current_url
  end

  private

  def url_params
    params
      .permit(:current_url)
  end
end
