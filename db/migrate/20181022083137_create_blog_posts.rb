class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :summary
      t.text :content
      #t.integer :users_id
      t.string :title_image_url

      t.timestamps
    end

    add_column :blog_posts, :users_id, :integer, null: false
    add_foreign_key :blog_posts, :users, column: :users_id
  end
end
