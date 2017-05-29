class RenameColumnOfAnswer < ActiveRecord::Migration[5.0]
  def change
    rename_column :exams, :quez_id, :quiz_id 
  end
end
