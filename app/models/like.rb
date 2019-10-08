class Like < ApplicationRecord
    belongs_to :user
    belongs_to :question

    # enum status: {none: 0, like: 1}
end
