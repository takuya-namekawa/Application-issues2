class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      
      t.string :name,null: false
      t.text :introduction,null: false
      t.integer :owner_id
      t.string :status
      t.references :user
     

      t.timestamps
    end
  end
end
