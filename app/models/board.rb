class Board < ApplicationRecord
  validates :title, :body, presence: true
end
