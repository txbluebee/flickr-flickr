class CommentsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @new_comment = @image.comments.new
  end

  def create
    @image = Image.find(params[:image_id])
    @new_comment = @image.comments.new(comment_params)
    if @new_comment.save
      redirect_to @image, notice: "comment successfully added!"
    else
      render :new
    end
  end

  def edit
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author, :image_id)
  end
end
