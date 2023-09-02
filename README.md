# CricketApiet-API
Create this application for local cricket_apiet tournament matches It's make for digital match score-book.


bundle install
rails g annotate:install
overcommit --install
rails generate rspec:install
rails g kaminari:config
rubocop -a



rails g scaffold user password email status:integer is_admin:boolean token user_type:integer && git add . && git commit -m "User model scaffold"

rails g scaffold player first_name middle_name last_name contact gender:integer birth_date:date speciality:integer user:references && git add . && git commit -m "Player model scaffold"

rails g scaffold team name status:integer state city location contact captain:references vice_captain:references && git add . && git commit -m "Team model scaffold"

rails g scaffold match team1:references team2:references number_of_overs:integer winner_team:references is_draw:boolean start_at:datetime end_at:datetime toss_winer_team:references won_by_wicket:integer won_by_runs:integer match_draw_reason:text toss_dicision:integer && git add . && git commit -m "Match model scaffold"

rails g scaffold inning match:references inning_type:integer bat_team:references total_runs:integer number_of_wickets start_at:datetime end_at:datetime target_to_opposition is_draw:integer draw_reason:text first_umpire:references second_umpire:references && git add . && git commit -m "Inning model scaffold"

rails g scaffold over real_ball_number:integer run_type:integer ball_status:integer wicket_type:integer strick_batsman:references non_strick_batsman:references bowler:references bowled_in_over:integer total_runs:integer over_number:integer inning:references &&  git add . && git commit -m "Over model scaffold"

rails g scaffold man_of_the_match inning:references reason:text player:references match:references team:references && git add . && git commit -m "Man_of_the_match model scaffold"

rails g scaffold gift inning:references reason:integer player:references match:references team:references name_of_donner:string amount:float description:text && git add . && git commit -m "Gift model scaffold"

bin/rails db:environment:set RAILS_ENV=development && rails db:drop db:create