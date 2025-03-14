# == Schema Information
#
# Table name: calendars
#
#  id             :bigint           not null, primary key
#  status         :string
#  time           :datetime
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  application_id :integer
#
class Calendar < ApplicationRecord


  belongs_to :application, required: true, class_name: "Application", foreign_key: "application_id" 
end
