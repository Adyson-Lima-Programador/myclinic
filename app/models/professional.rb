class Professional < ApplicationRecord

  has_many :appointment, dependent: :destroy

  validates :name, :email, :cell_phone, :cpf, :specialty, presence: true

end
