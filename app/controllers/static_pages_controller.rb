class StaticPagesController < ApplicationController
  require 'flickr'
  def home
    begin
      flickr = Flickr.new  ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET']
    unless params[:user_id].nil?
      @photos = flickr.people.getPublicPhotos(:user_id => params[:user_id]) if params[:user_id]
    end
    rescue StandardError => error
      flash[:alert] = "#{error.message}. Please try again!"
      redirect_to root_path
    end
  end

end
