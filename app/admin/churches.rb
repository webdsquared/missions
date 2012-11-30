ActiveAdmin.register Church do
  index do
		column "Church Name", :name
		column :city
		column :state
		column :link
		default_actions
	end 

	form do |f|
		f.inputs "Details" do
			f.input :name, hint: "Church or Ministry Name"
			f.input :city, hint: "City"
			f.input :state, hint: "State, Example: TN"
			f.input :link, hint: "Example: http://example.com (MUST use http:// for link to function)"
		end
		f.buttons
	end
end
