class AddAnotacaoContato < ActiveRecord::Migration[5.0]
  def change
    add_column :contatos, :anotacao, :string
  end
end
