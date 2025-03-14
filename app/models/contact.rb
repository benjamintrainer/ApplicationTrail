# == Schema Information
#
# Table name: contacts
#
#  id             :bigint           not null, primary key
#  bio            :string
#  company        :string
#  email          :string
#  linkedin       :string
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  application_id :integer
#
class Contact < ApplicationRecord

  
  belongs_to :application, required: true, class_name: "Application", foreign_key: "application_id" 
end
