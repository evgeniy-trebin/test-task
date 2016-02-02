class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :photo, null: false
      t.string :sex, null: false

      t.timestamps null: false
    end
  end
end
