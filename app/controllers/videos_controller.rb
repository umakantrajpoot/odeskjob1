class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def edit
    @video = Video.find(params[:id])
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    if @video.save!
      redirect_to @video, notice: 'video was successfully uploaded.'
    else
      render action: 'new'
    end
  end

  def update
    @video = Video.find(params[:id])
    if @video.update
      redirect_to @video, notice: 'video was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_url, notice: 'video was successfully deleted.'
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:listing_id, :title, :vid, :video, :vid_cache)
    end

end
