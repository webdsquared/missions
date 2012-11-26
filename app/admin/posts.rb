ActiveAdmin.register Post do
	index do
		column "Post Title", :title
		column :created_at
		column :status
		default_actions
	end 

	form do |f|
		f.inputs "Info" do
			f.input :blog
			f.input :title
			f.input :published_on
			f.input :status, as: :select, collection: ["Draft", "Published"]
			f.input :body, input_html: { class: "redactor", id: "redactor" }
			f.input :categories, as: :check_boxes
			f.buttons
		end
 	end  
end
