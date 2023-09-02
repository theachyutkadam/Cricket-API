FactoryBot.define do
  factory :inning do
    match { nil }
    inning_type { 1 }
    bat_team { nil }
    total_runs { 1 }
    number_of_wickets { "MyString" }
    start_at { "2023-09-02 22:23:10" }
    end_at { "2023-09-02 22:23:10" }
    target_to_opposition { "MyString" }
    is_draw { 1 }
    draw_reason { "MyText" }
    first_umpire { nil }
    second_umpire { nil }
  end
end
