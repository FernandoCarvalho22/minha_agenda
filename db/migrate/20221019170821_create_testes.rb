class CreateTestes < ActiveRecord::Migration[5.0]
  def change
    create_table :testes do |t|
      t.string :nome
      t.integer :numero
      t.decimal :valor, precision: 10, scale: 2, default: 0
      t.boolean :ativo, default: true
      t.json :codigo

      t.timestamps
    end
  end
end
