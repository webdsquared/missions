ActiveAdmin.register Link do
  
	index do 
		column :name
		column :link
		default_actions
	end	

	form do |f|
		f.inputs "Details" do
			f.input :name, hint: "Enter a name for the link"
			f.input :link, hint: "Link must be entered with http://.  Example: http://website.com or http://www.website.com"
		end
		f.buttons
 	end

end
