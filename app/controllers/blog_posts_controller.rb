class BlogPostsController < ApplicationController
  include BlogPostsHelper
  before_action :logged_in_user, except: [:index, :show]
  before_action :check_permission, only: [:edit, :update, :destroy]

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

    if @blogpost.users_id.nil?
      @blogpost.users_id = current_user.id
    end

    if @blogpost.save
      flash[:success] = "Blog Post '#{@blogpost.title}' created!"
      redirect_to blog_post_path(@blogpost)
    else
      render 'new'
    end
  end


  def check_permission
    @blogpost = BlogPost.find(params[:id])
    if current_user.id != @blogpost.users_id && !current_user.is_admin
      flash[:danger] = "Youre not permitted to access the page"
      redirect_to blog_posts_path
    end
  end


  def edit
    @blogpost = BlogPost.find(params[:id])
  end

  def update
    @blogpost = BlogPost.find(params[:id])

    if @blogpost.update(blogposts_params)
      flash[:success] = "Blog Post '#{@blogpost.title}' was updated!"
      redirect_to blog_post_path(@blogpost)
    else
      render 'edit'
    end
  end

  def destroy
    @blogpost = BlogPost.find(params[:id])
    @blogpost.destroy
    flash[:success] = "Post '#{@blogpost.title}' destroyed!"
    redirect_to blog_posts_path
  end
end
