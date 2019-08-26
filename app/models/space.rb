class Space < ApplicationRecord
  belongs_to :user
  has_many :groups

  validates :name, presence: true
end
