class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :adventure, index: true, foreign_key: true
      t.references :actor
      t.references :inspirer
      t.boolean :done
      t.float :rating
      t.datetime :start_date
      t.datetime :end_date
      t.text :address
      t.text :private_note
      t.text :public_review

      t.timestamps null: false
    end
  end
end
