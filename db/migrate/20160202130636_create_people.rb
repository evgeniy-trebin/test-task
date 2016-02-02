class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :photo
      t.string :sex, null: false

      t.timestamps null: false
    end
  end
end
