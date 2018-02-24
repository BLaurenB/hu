class Category < ApplicationRecord
  has_many :ventures
  has_many :users, through: :ventures
end
