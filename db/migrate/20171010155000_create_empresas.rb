class CreateEmpresas < ActiveRecord::Migration[5.1]
  def change
    create_table :empresas do |t|
      t.string :name
      t.string :cnpj
      t.string :detalhamentos
      t.string :tipo

      t.timestamps
    end
  end
end
