class CalendarsController < ApplicationController
  def index
    matching_calendars = Calendar.all

    @list_of_calendars = matching_calendars.order({ :created_at => :desc })

    render({ :template => "calendars/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_calendars = Calendar.where({ :id => the_id })

    @the_calendar = matching_calendars.at(0)

    render({ :template => "calendars/show" })
  end

  def create
    the_calendar = Calendar.new
    the_calendar.title = params.fetch("query_title")
    the_calendar.time = params.fetch("query_time")
    the_calendar.status = params.fetch("query_status")
    the_calendar.application_id = params.fetch("query_application_id")

    if the_calendar.valid?
      the_calendar.save
      redirect_to("/calendars", { :notice => "Calendar created successfully." })
    else
      redirect_to("/calendars", { :alert => the_calendar.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_calendar = Calendar.where({ :id => the_id }).at(0)

    the_calendar.title = params.fetch("query_title")
    the_calendar.time = params.fetch("query_time")
    the_calendar.status = params.fetch("query_status")
    the_calendar.application_id = params.fetch("query_application_id")

    if the_calendar.valid?
      the_calendar.save
      redirect_to("/calendars/#{the_calendar.id}", { :notice => "Calendar updated successfully."} )
    else
      redirect_to("/calendars/#{the_calendar.id}", { :alert => the_calendar.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_calendar = Calendar.where({ :id => the_id }).at(0)

    the_calendar.destroy

    redirect_to("/calendars", { :notice => "Calendar deleted successfully."} )
  end
end
