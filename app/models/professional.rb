class Professional < ApplicationRecord

  validates :name, :email, :cell_phone, :cpf, :specialty, presence: true

end
