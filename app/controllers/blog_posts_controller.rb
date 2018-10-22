class BlogPostsController < ApplicationController
  def index
    @blogposts = BlogPost.all
  end

  def show
    @blogpost = BlogPost.find(params[:id])
  end

  def destroy
    @blogpost = BlogPost.find(params[:id])
    @blogpost.destroy
    flash.notice = "Post #{@blogpost.title} destroyed!"
    redirect_to blog_posts_path
  end
end
