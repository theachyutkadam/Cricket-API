FactoryBot.define do
  factory :match do
    team1 { nil }
    team2 { nil }
    number_of_overs { 1 }
    winner_team { nil }
    is_draw { false }
    start_at { "2023-09-02 22:23:05" }
    end_at { "2023-09-02 22:23:05" }
    toss_winer_team { nil }
    won_by_wicket { 1 }
    won_by_runs { 1 }
    match_draw_reason { "MyText" }
    toss_dicision { 1 }
  end
end
