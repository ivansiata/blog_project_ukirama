require 'csv'
namespace :blog do

  EMAIL_ADMIN = "ivansiata@gmail.com"

  desc "Import User"
  task import_user: :environment do
    csv = CSV.open('user.csv', :headers => true, header_converters: :symbol)
    errors = []
    csv.each_with_index do |row, index|

      user = User.new(name: row[:name], email: row[:email], password: row[:password], is_admin: row[:is_admin])

      if user.valid?
        User.create!(name: row[:name], email: row[:email], password: row[:password], is_admin: row[:is_admin])
      else
        errors << "line #{index + 1}: " + user.errors.full_messages.join(", ")
      end
    end

  end

  desc "Import Blog Post"
  task import_blog: :environment do
    csv = CSV.open('blogpost.csv', :headers => true, header_converters: :symbol)
    errors = []
    csv.each_with_index do |row, index|
      email = row[:email]

      if email.nil?
        email = EMAIL_ADMIN
      end

      user = User.find_by(email: email)

      if user.nil?
        errors << "line #{index + 1}: error : Email not found "

      else
        blog = BlogPost.new(title: row[:title], summary: row[:summary], content: row[:content], users_id: user.id, title_image_url: row[:title_image_url])

        if blog.valid?
          BlogPost.create!(title: row[:title], summary: row[:summary], content: row[:content], users_id: user.id, title_image_url: row[:title_image_url])
        else
          errors << "line #{index + 1}: " + blog.errors.full_messages.join(", ")
        end
      end
    end

  end

end
