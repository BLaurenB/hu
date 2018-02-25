FactoryBot.define do
  factory :venture do
    sequence(:title) {|n| "Venture #{n}" }
    sequence(:description) {|n| "Venture Description #{n}" }
    notes "MyString"
    user
    category
  end
end
