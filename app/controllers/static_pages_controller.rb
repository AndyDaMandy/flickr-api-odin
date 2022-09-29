class StaticPagesController < ApplicationController
  require 'flickr'
  def home
    ENV['FLICKR_API_KEY']
    ENV['FLICKR_SHARED_SECRET']
    flicker = Flickr.new  
  end
end
