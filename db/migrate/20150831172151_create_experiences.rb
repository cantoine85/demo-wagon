class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.string :address
      t.datetime :date
      t.string :progress_status
      t.references :author_experience, index: true
      t.references :direct_parent_experience, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
