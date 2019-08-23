class Space < ApplicationRecord
  belongs_to :user
  has_many :lists

  validates :name, presence: true
end
