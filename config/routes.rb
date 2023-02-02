Rails.application.routes.draw do
  get("/", {:controller=>"application", :action=>"homepage"})
  get("/forex", {:controller=>"currency", :action=>"first_currency"})
  get("/forex/:from_currency", {:controller=>"currency", :action=>"second_currency"})
  get("/forex/:from_currency/:to_currency",{:controller=>"currency", :action=>"third_currency"} )
end
