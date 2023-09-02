FactoryBot.define do
  factory :over do
    real_ball_number { 1 }
    run_type { 1 }
    ball_status { 1 }
    wicket_type { 1 }
    strick_batsman { nil }
    non_strick_batsman { nil }
    bowler { nil }
    bowled_in_over { 1 }
    total_runs { 1 }
    over_number { 1 }
    inning { nil }
  end
end
