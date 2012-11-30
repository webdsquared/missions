ActiveAdmin.register Post do
	
	index do
			column "Post Title", :title
			column :blog
			column :published_on
			column :status
			column "Category", :categories do |post|
				post.categories.collect { |cat|  cat.name }.join(", ")
			end
			default_actions
		
	end 

	show do
		h5 "Created by #{post.blog.name} on #{post.created_at.strftime('%B %-d, %Y')}"
		h5 "Categories: #{post.categories.collect { |cat|  cat.name }.join(", ")}"
		h5 "Current Status: #{post.status}"
		h5 "Published On Date: #{post.published_on.strftime('%B %-d, %Y')} - (will only be posted if marked with Publish as status)"
		div do
			simple_format post.body
		end
		h4 link_to "Back to Posts", admin_posts_path
	end

	form do |f|
		f.inputs "Details" do
			f.input :blog, hint: "Select a blog"
			f.input :title, hint: "Enter blog post title"
			f.input :published_on, as: :date, include_blank: false, hint: "Select a date", :prompt => {:day => "Day", :month => "Month", :year => "Year"}, :start_year => Time.now.year
			f.input :status, as: :select, collection: ["Draft", "Published"], include_blank: false, hint: 'Select "Draft" to save and post later, and "Publish" to post now'
			f.input :categories, as: :check_boxes, collection: Category.all
			f.input :body, input_html: { class: "redactor", id: "redactor" }
		end
		f.buttons
 	end  
end