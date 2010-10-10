module ApplicationHelper
  def gmaps4rails_filters_display(model)
    if model.constantize.respond_to?("gmaps4rails_filters") 
      display = '<form name="gmaps4rails_form">'
    	display += '<select name="gmaps4rails_list" onChange="gmaps4rails_resfreshmap()">'
    	model.constantize.gmaps4rails_filters.each do |filter_hash|
    		display += '<option value="' + filter_hash["filter"] + '+' + filter_hash["options"] +'">' + filter_hash["display"]
    	end
    	display += '</select></form>'
    end
    return display
  end
end
