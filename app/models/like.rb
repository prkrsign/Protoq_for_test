class Like < ApplicationRecord
    belongs_to :to_user, class_name: "User"
    belongs_to :from_user, class_name: "User"

    enum status: {none: 0, like: 1}
end
