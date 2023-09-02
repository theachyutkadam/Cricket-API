FactoryBot.define do
  factory :player do
    first_name { "MyString" }
    middle_name { "MyString" }
    last_name { "MyString" }
    contact { "MyString" }
    gender { 1 }
    birth_date { "2023-09-02" }
    speciality { 1 }
    user { nil }
  end
end
