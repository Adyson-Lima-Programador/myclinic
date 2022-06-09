class Appointment < ApplicationRecord

  belongs_to :customer
  belongs_to :professional

  validates :date, :hour, :customer_id, :professional_id, :type, presence: true

end
