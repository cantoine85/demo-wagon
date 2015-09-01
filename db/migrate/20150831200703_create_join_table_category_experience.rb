class CreateJoinTableCategoryExperience < ActiveRecord::Migration
  def change
    create_join_table :categories, :experiences do |t|
      # t.index [:category_id, :experience_id]
      # t.index [:experience_id, :category_id]
    end
  end
end
