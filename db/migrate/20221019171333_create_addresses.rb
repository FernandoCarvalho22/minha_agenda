class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street  
      t.integer :number
      t.string :district
      t.integer :zipcode
      t.string :city
      

      t.timestamps
    end
  end
end
