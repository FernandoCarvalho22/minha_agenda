class ChangeNameUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :nome, :name
  end
end
