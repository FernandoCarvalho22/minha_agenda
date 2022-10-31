class AddEmailToContato < ActiveRecord::Migration[5.0]
  def change
    add_column :contatos, :email, :string
  end
end
