class Post < ApplicationRecord
  belongs_to :user
  # validates :text, length: { maximum: 140 }
  validates :text, presence: true, length: { maximum: 140 }
end
