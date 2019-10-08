class CreateQuestionContents < ActiveRecord::Migration[5.2]
  def change
    create_table :question_contents do |t|
      t.text :content, limit: 16777215
      t.text :rendered_content, limit: 16777215
      t.references :question, foreign_key: true
    end
  end
end
