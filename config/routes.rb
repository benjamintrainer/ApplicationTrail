Rails.application.routes.draw do
  devise_for :users

  # Routes for the Calendar resource:

  root "applications#index"

  # CREATE
  post("/insert_calendar", { :controller => "calendars", :action => "create" })
          
  # READ
  get("/calendars", { :controller => "calendars", :action => "index" })
  
  get("/calendars/:path_id", { :controller => "calendars", :action => "show" })
  
  # UPDATE
  
  post("/modify_calendar/:path_id", { :controller => "calendars", :action => "update" })
  
  # DELETE
  get("/delete_calendar/:path_id", { :controller => "calendars", :action => "destroy" })

  #------------------------------

  # Routes for the Application resource:

  # CREATE
  post("/insert_application", { :controller => "applications", :action => "create" })
          
  # READ
  get("/applications", { :controller => "applications", :action => "index" })
  
  get("/applications/:path_id", { :controller => "applications", :action => "show" })

  # New Application Page Route
  get("/applications/new", { controller: "applications", action: "new" })
  
  # UPDATE
  
  post("/modify_application/:path_id", { :controller => "applications", :action => "update" })
  get("/applications/:path_id/edit", { controller: "applications", action: "edit" })

  
  # DELETE
  get("/delete_application/:path_id", { :controller => "applications", :action => "destroy" })

  #------------------------------

  # Routes for the Contact resource:

  # CREATE
  post("/insert_contact", { :controller => "contacts", :action => "create" })
          
  # READ
  get("/contacts", { :controller => "contacts", :action => "index" })
  
  get("/contacts/:path_id", { :controller => "contacts", :action => "show" })
  
  # UPDATE
  
  post("/modify_contact/:path_id", { :controller => "contacts", :action => "update" })
  
  # DELETE
  get("/delete_contact/:path_id", { :controller => "contacts", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
