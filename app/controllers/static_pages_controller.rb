class StaticPagesController < ApplicationController
  require 'flickr'
  def home
      flickr = Flickr.new  ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET']
      if flickr_params.present?
        begin
          @photos = flickr.people.getPublicPhotos({:user_id => flickr_params[:user_id]})
        rescue Flickr::FailedResponse
          redirect_to root_path, notice: "User not Found"
        end
       end
  end

  private
  def flickr_params
      params.permit(:user_id, :commit)
  end

end
