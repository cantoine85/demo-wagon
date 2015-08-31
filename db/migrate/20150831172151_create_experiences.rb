class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.string :address
      t.datetime :date
      t.boolean :done
      t.integer :experience_parent_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
