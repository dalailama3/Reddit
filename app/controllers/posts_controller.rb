class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    render :show
  end
  def new
    @post = Post.new

    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      # params[:post][:sub_ids].each do |sub_id|
      #
      #   PostSub.create!(post_id: @post.id, sub_id: sub_id)
      # end
      redirect_to post_url(@post)

    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, sub_ids: [])
  end

end
