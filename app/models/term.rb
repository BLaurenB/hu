class Term < ApplicationRecord
  validates :word_1, presence: true

  # belongs_to :model, polymorphic: true

  belongs_to :venture
  belongs_to :snapshot
  has_one :user, through: :venture

end
