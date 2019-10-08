class QuestionContent < ApplicationRecord
  include ParseMarkdown
  belongs_to :question
  validates :content, presence: true
  before_save :parse_markdown
end
