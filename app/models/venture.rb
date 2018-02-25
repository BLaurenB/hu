class Venture < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :user
  belongs_to :category
  has_many :terms
  has_many :snapshots
end
