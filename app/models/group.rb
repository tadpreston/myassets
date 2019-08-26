class Group < ApplicationRecord
  belongs_to :space

  validates :title, presence: true
end
