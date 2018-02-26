class Term < ApplicationRecord
  validates :words, presence: true
  serialize :words, Array


  belongs_to :venture
  belongs_to :snapshot
  has_one :user, through: :venture

end
