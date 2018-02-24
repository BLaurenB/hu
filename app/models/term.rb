class Term < ApplicationRecord
  belongs_to :venture
  belongs_to :snapshot
  belongs_to :user, through: :venture
end
