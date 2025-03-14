class ApplicationsController < ApplicationController
  def index
    matching_applications = Application.all

    @list_of_applications = matching_applications.order({ :created_at => :desc })

    render({ :template => "applications/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_applications = Application.where({ :id => the_id })

    @the_application = matching_applications.at(0)

    render({ :template => "applications/show" })
  end

  def create
    the_application = Application.new
    the_application.role = params.fetch("query_role")
    the_application.description = params.fetch("query_description")
    the_application.status = params.fetch("query_status")
    the_application.user_id = params.fetch("query_user_id")
    the_application.company = params.fetch("query_company")
    the_application.location = params.fetch("query_location")

    if the_application.valid?
      the_application.save
      redirect_to("/applications", { :notice => "Application created successfully." })
    else
      redirect_to("/applications", { :alert => the_application.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_application = Application.where({ :id => the_id }).at(0)

    the_application.role = params.fetch("query_role")
    the_application.description = params.fetch("query_description")
    the_application.status = params.fetch("query_status")
    the_application.user_id = params.fetch("query_user_id")
    the_application.company = params.fetch("query_company")
    the_application.location = params.fetch("query_location")

    if the_application.valid?
      the_application.save
      redirect_to("/applications/#{the_application.id}", { :notice => "Application updated successfully."} )
    else
      redirect_to("/applications/#{the_application.id}", { :alert => the_application.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_application = Application.where({ :id => the_id }).at(0)

    the_application.destroy

    redirect_to("/applications", { :notice => "Application deleted successfully."} )
  end
  
  def edit
    @the_application = Application.find_by(id: params[:path_id])
    render({ template: "applications/edit" })
  end
  
end
