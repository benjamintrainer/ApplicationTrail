# == Schema Information
#
# Table name: applications
#
#  id          :bigint           not null, primary key
#  company     :string
#  description :text
#  location    :string
#  role        :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Application < ApplicationRecord

  validates :role, presence: true
  validates :company, presence: true
  validates :status, presence: true
  validates :user_id, presence: true

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  has_many :contacts, class_name: "Contact", foreign_key: "application_id", dependent: :destroy

  has_many :deadline, class_name: "Calendar", foreign_key: "application_id", dependent: :destroy
end
