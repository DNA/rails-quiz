# == Schema Information
#
# Table name: people
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  phone_number :string           not null
#  email        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :integer
#

class Person < ApplicationRecord
  has_and_belongs_to_many :companies

  validates :name, :phone_number, :email_confirmation, presence: true
  validates :email, confirmation: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: 'is not a valid email address'
                    }

  accepts_nested_attributes_for :companies
end
