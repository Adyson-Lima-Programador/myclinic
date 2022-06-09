class CreateProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :email
      t.string :cell_phone
      t.string :cpf
      t.string :specialty

      t.timestamps
    end
  end
end
