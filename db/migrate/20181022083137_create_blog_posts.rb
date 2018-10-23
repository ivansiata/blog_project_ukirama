class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.text :content, null: false
      #t.integer :users_id
      t.string :title_image_url

      t.timestamps
    end

    add_column :blog_posts, :users_id, :integer, null: false
    add_foreign_key :blog_posts, :users, column: :users_id
  end
end
