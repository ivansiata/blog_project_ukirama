class BlogPostsController < ApplicationController
  include BlogPostsHelper

  def index
    @blogposts = BlogPost.all
  end

  def new
    @blogpost = BlogPost.new
  end

  def show
    @blogpost = BlogPost.find(params[:id])
  end

  def create
    @blogpost = BlogPost.new(blogposts_params)

    if @blogpost.save
      flash.notice = "Blog Post '#{@blogpost.title}' created!"
      redirect_to blog_post_path(@blogpost)
    else
      render 'new'
    end
  end

  def edit
    @blogpost = BlogPost.find(params[:id])
  end

  def update
    @blogpost = BlogPost.find(params[:id])

    if @blogpost.update(blogposts_params)
      flash.notice = "Blog Post '#{@blogpost.title}' was updated!"
      redirect_to blog_post_path(@blogpost)
    else
      render 'edit'
    end
  end

  def destroy
    @blogpost = BlogPost.find(params[:id])
    @blogpost.destroy
    flash.notice = "Post '#{@blogpost.title}' destroyed!"
    redirect_to blog_posts_path
  end
end
