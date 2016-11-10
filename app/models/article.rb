class Article < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  default_scope { order(created_at: :desc) }
end
