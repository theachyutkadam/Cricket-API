FactoryBot.define do
  factory :user do
    password { "MyString" }
    email { "MyString" }
    status { 1 }
    is_admin { false }
    token { "MyString" }
    user_type { 1 }
  end
end
