class TagsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @new_tag = @image.tags.new
    @users = User.all
    user_names = []
    @users.each do |user|
      user_names.push(user.name)
    end
    @usernames = user_names
  end

  def create
    @image = Image.find(params[:image_id])
    @new_tag = @image.tags.create(tag_params)
    redirect_to image_path(@image),  notice: "tag successfully added!"
  end

  def destroy
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to image_path(@image)
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def tag_params
    params.require(:tag).permit(:name)
  end

end
