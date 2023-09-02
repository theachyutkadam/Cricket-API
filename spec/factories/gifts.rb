FactoryBot.define do
  factory :gift do
    inning { nil }
    reason { 1 }
    player { nil }
    match { nil }
    team { nil }
    name_of_donner { "MyString" }
    amount { 1.5 }
    description { "MyText" }
  end
end
