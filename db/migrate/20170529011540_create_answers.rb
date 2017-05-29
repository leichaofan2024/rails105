class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :exam_id
      t.integer :question_id

      t.timestamps
    end
  end
end
