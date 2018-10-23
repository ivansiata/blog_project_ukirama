module BlogPostsHelper
  def blogposts_params
    params.require(:blog_post).permit(:title, :summary, :content, :users_id, :title_image_url)
  end

  def options_for_usersid
    User.all.map do |u|
      [u.name, u.id]
    end
  end
end
