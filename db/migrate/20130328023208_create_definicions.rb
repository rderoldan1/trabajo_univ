class CreateDefinicions < ActiveRecord::Migration
  def change
    create_table :definicions do |t|
      t.string :name
      t.string :surname
      t.text :sanar
      t.text :tinta

      t.timestamps
    end
  end
end
