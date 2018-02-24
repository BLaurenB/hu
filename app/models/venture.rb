class Venture < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :terms
  has_many :snapshots
end
