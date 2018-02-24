class Term < ApplicationRecord
  belongs_to :venture
  belongs_to :snapshot
  has_one :user, through: :venture

end
