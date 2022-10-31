class AddNomeMaeToContatos < ActiveRecord::Migration[5.0]
  def change
    add_column :contatos, :nome_mae, :string
  end
end
