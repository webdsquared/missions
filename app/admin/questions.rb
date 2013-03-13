ActiveAdmin.register Question do
  
	index do
		column "Question", :question
		column "Answer", :answer
		column "Order", :position
		default_actions
	end

	form do |f|
		f.inputs "Questions" do
			f.input :question, :hint => "Add a question"
			f.input :answer
			f.input :position, :hint => "Use increments of 10"
		end
		f.buttons
	end

end
