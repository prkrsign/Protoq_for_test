class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content, limit: 16777215
      t.text :rendered_content, limit: 16777215
      t.references :question, foreign_key: true
      t.timestamps
    end
  end
end
