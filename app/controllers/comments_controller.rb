class CommentsController < InheritedResources::Base

  def index
    @comment           = Comment.new
    @comments          = Comment.order('id DESC').limit(10)
    @comments_quantity = Comment.all.size
  end

  def create
    if params[:comment][:body].present?
      @comment           = Comment.create(params[:comment])
      Pusher['livecomments'].trigger('new_message', {:message => @comment.body, :time => @comment.created_at.civil, :total_quantity => Comment.all.size})
    end
  end

end
