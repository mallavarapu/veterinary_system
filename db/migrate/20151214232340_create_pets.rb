class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.string :breed
      t.integer :age
      t.decimal :weight
      t.date :last_visit
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :pets, :customers
  end
end
