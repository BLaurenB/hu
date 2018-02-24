class Term < ApplicationRecord
  belongs_to :venture
  belongs_to :snapshot
  #may need to add has_one :user, through: :venture, but that seemed to cause trouble with Heroku

end
