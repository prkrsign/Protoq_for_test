class Like < ApplicationRecord
    belongs_to :user
    belongs_to :question

    def like?(user)
        likes.include?(user)
    end

    # enum status: {none: 0, like: 1}
end
