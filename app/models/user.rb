class User < ApplicationRecord

  has_one :authentication
  has_many :ventures



end
