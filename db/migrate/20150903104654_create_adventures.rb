class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.references :user, index: true, foreign_key: true
      t.string :category
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.text :address
      t.float :duration

      t.timestamps null: false
    end
  end
end
