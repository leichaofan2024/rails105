class AddIsCorrectToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :is_correct, :boolean
  end
end
