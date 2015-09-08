class AddIndexOnStatusForExperiences < ActiveRecord::Migration
  def change
    add_index :experiences, :status
  end
end
