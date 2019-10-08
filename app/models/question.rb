class Question < ApplicationRecord
  has_many   :question_contents, dependent: :destroy
  has_many   :answers
  belongs_to :user
  belongs_to :category
  validates :title, :category_id, presence: true
  accepts_nested_attributes_for :question_contents, allow_destroy: true
  is_impressionable
  has_many :likes, dependent: :destroy



end
