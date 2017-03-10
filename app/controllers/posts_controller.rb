class PostsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @posts = Group.posts
  end
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end
  def show


    @post = Post.find(params[:id])

  end
  def edit
    @group = Group.find(params[:group_id ])
    @post = Post.find(params[:id])
  end
  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.group = @group
    @post.user = current_user
    if @post.update
      redirect_to group_path(@group),notie: "更新成功！"
    else
      render :edit
    end
  end
  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "删除成功！"
    redirect_to group_path(@group)
  end
  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
