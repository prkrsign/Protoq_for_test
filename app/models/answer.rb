class Answer < ApplicationRecord
  include ParseMarkdown
  belongs_to :question
  belongs_to :user
  validates :content, presence: true
  before_save :parse_markdown
end
