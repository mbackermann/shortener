class UrlsController < ApplicationController

  def create
    if params[:url].present?
      @url = Url.find_by(sanitize_url: Url.generate_sanitize_url(params[:url]))
    end
    if @url.nil?
      @url = Url.create!(url_params)
    end
    SetWebsiteTitleJob.perform_later @url
    response_json({url: redirect_url(@url.short_url)}, :created)
  end

  def top
    @urls = Url.order("visits DESC").limit(100)
    render json: @urls, status: :ok, only: [:url, :visits, :title]
  end

  def redirect
    @url = Url.find_by(short_url: params[:uuid])
    if @url.nil?
      raise ActiveRecord::RecordNotFound, 'URL not found'
    end
    @url.visited!
    redirect_to @url.url
  end

  private

  def url_params
    params
      .permit(:url)
  end
end
