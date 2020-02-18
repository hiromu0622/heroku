class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic = Topic.find_by(id: params[:topic_id])
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    # binding.pry
    if @comment.save
      redirect_to topics_path, success: "投稿に成功しました"
    else
      @topic = Topic.find_by(id: params[:comment][:topic_id])
      flash.now[:danger] = "投稿に失敗しました"
      render "/topics/show"
    end  
  end
  
  private
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end
end
