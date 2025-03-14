class ContactsController < ApplicationController
  def index
    matching_contacts = Contact.all

    @list_of_contacts = matching_contacts.order({ :created_at => :desc })

    render({ :template => "contacts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_contacts = Contact.where({ :id => the_id })

    @the_contact = matching_contacts.at(0)

    render({ :template => "contacts/show" })
  end

  def create
    the_contact = Contact.new
    the_contact.email = params.fetch("query_email")
    the_contact.phone = params.fetch("query_phone")
    the_contact.linkedin = params.fetch("query_linkedin")
    the_contact.bio = params.fetch("query_bio")
    the_contact.application_id = params.fetch("query_application_id")
    the_contact.company = params.fetch("query_company")

    if the_contact.valid?
      the_contact.save
      redirect_to("/contacts", { :notice => "Contact created successfully." })
    else
      redirect_to("/contacts", { :alert => the_contact.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_contact = Contact.where({ :id => the_id }).at(0)

    the_contact.email = params.fetch("query_email")
    the_contact.phone = params.fetch("query_phone")
    the_contact.linkedin = params.fetch("query_linkedin")
    the_contact.bio = params.fetch("query_bio")
    the_contact.application_id = params.fetch("query_application_id")
    the_contact.company = params.fetch("query_company")

    if the_contact.valid?
      the_contact.save
      redirect_to("/contacts/#{the_contact.id}", { :notice => "Contact updated successfully."} )
    else
      redirect_to("/contacts/#{the_contact.id}", { :alert => the_contact.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_contact = Contact.where({ :id => the_id }).at(0)

    the_contact.destroy

    redirect_to("/contacts", { :notice => "Contact deleted successfully."} )
  end
end
