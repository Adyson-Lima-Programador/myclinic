class Customer < ApplicationRecord

  validates :name, :email, :cell_phone, :cpf, :age, presence: true 
end
