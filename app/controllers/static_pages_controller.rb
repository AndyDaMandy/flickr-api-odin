class StaticPagesController < ApplicationController
  require 'flickr'
  def home
    flickr = Flickr.new  ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET']

    list   = flickr.photos.getRecent
  end

  private
  def search_params
    params.require(:search).permit(:id)
  end
end
