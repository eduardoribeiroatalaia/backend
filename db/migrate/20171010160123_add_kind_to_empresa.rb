class AddKindToEmpresa < ActiveRecord::Migration[5.1]
  def change
    add_reference :empresas, :kind, foreign_key: true
  end
end
