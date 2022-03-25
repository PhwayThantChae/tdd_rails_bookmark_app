class Bookmark < ApplicationRecord
    validates :title, :url, presence: true, allow_blank: false
end
