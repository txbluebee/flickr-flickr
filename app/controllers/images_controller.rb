class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @user = current_user
    @image = @user.images.new
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)
    if @image.save
      redirect_to images_path,  notice: "image successfully added!"
    else
      render :new
    end
  end

  def show
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def image_params
    params.require(:image).permit(:attachment, :title)
  end
end