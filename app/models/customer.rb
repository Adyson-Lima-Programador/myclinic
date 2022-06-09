class Customer < ApplicationRecord

  has_many :appointment, dependent: :destroy

  validates :name, :email, :cell_phone, :cpf, :age, presence: true 
end
