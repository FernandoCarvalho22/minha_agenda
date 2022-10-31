class RemoveAnotFromContato < ActiveRecord::Migration[5.0]
  def change
    remove_column :contatos, :anot 
  end
end
