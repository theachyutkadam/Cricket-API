FactoryBot.define do
  factory :team do
    name { "MyString" }
    status { 1 }
    state { "MyString" }
    city { "MyString" }
    location { "MyString" }
    contact { "MyString" }
    captain { nil }
    vice_captain { nil }
  end
end
