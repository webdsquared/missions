ActiveAdmin.register Category do
 index do
 	column "Category Name", :name
 	default_actions
 end  

 form do |f|
		f.inputs "Details" do
			f.input :name, hint: "Enter new post category"
		end
		f.buttons
 	end

end
