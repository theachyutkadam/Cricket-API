# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_02_165323) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.bigint "inning_id", null: false
    t.integer "reason"
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.bigint "team_id", null: false
    t.string "name_of_donner"
    t.float "amount"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inning_id"], name: "index_gifts_on_inning_id"
    t.index ["match_id"], name: "index_gifts_on_match_id"
    t.index ["player_id"], name: "index_gifts_on_player_id"
    t.index ["team_id"], name: "index_gifts_on_team_id"
  end

  create_table "innings", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "inning_type", null: false
    t.bigint "bat_team_id", null: false
    t.integer "total_runs", default: 0, null: false
    t.string "number_of_wickets", default: "0", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "target_to_opposition"
    t.integer "is_draw"
    t.text "draw_reason"
    t.bigint "first_umpire_id", null: false
    t.bigint "second_umpire_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bat_team_id"], name: "index_innings_on_bat_team_id"
    t.index ["first_umpire_id"], name: "index_innings_on_first_umpire_id"
    t.index ["match_id"], name: "index_innings_on_match_id"
    t.index ["second_umpire_id"], name: "index_innings_on_second_umpire_id"
  end

  create_table "man_of_the_matches", force: :cascade do |t|
    t.bigint "inning_id", null: false
    t.text "reason"
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inning_id"], name: "index_man_of_the_matches_on_inning_id"
    t.index ["match_id"], name: "index_man_of_the_matches_on_match_id"
    t.index ["player_id"], name: "index_man_of_the_matches_on_player_id"
    t.index ["team_id"], name: "index_man_of_the_matches_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "team1_id", null: false
    t.bigint "team2_id", null: false
    t.integer "number_of_overs", null: false
    t.bigint "winner_team_id"
    t.boolean "is_draw"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "status", null: false
    t.bigint "toss_winer_team_id", null: false
    t.integer "won_by_wicket", default: 0
    t.integer "won_by_runs", default: 0
    t.text "match_draw_reason"
    t.integer "toss_dicision", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team1_id"], name: "index_matches_on_team1_id"
    t.index ["team2_id"], name: "index_matches_on_team2_id"
    t.index ["toss_winer_team_id"], name: "index_matches_on_toss_winer_team_id"
    t.index ["winner_team_id"], name: "index_matches_on_winner_team_id"
  end

  create_table "overs", force: :cascade do |t|
    t.integer "real_ball_number", default: 0, null: false
    t.integer "run_type"
    t.integer "ball_status", null: false
    t.integer "wicket_type"
    t.bigint "strick_batsman_id", null: false
    t.bigint "non_strick_batsman_id", null: false
    t.bigint "bowler_id", null: false
    t.integer "bowled_in_over", default: 0
    t.integer "total_runs", default: 0, null: false
    t.integer "over_number", default: 0, null: false
    t.bigint "inning_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bowler_id"], name: "index_overs_on_bowler_id"
    t.index ["inning_id"], name: "index_overs_on_inning_id"
    t.index ["non_strick_batsman_id"], name: "index_overs_on_non_strick_batsman_id"
    t.index ["strick_batsman_id"], name: "index_overs_on_strick_batsman_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "contact", null: false
    t.integer "gender", null: false
    t.date "birth_date"
    t.integer "speciality", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact"], name: "index_players_on_contact", unique: true
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status"
    t.string "state"
    t.string "city"
    t.string "location"
    t.string "contact", null: false
    t.bigint "captain_id", null: false
    t.bigint "vice_captain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captain_id"], name: "index_teams_on_captain_id"
    t.index ["vice_captain_id"], name: "index_teams_on_vice_captain_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password", null: false
    t.string "email", null: false
    t.integer "status", null: false
    t.string "token"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "gifts", "innings"
  add_foreign_key "gifts", "matches"
  add_foreign_key "gifts", "players"
  add_foreign_key "gifts", "teams"
  add_foreign_key "innings", "matches"
  add_foreign_key "innings", "players", column: "first_umpire_id"
  add_foreign_key "innings", "players", column: "second_umpire_id"
  add_foreign_key "innings", "teams", column: "bat_team_id"
  add_foreign_key "man_of_the_matches", "innings"
  add_foreign_key "man_of_the_matches", "matches"
  add_foreign_key "man_of_the_matches", "players"
  add_foreign_key "man_of_the_matches", "teams"
  add_foreign_key "matches", "teams", column: "team1_id"
  add_foreign_key "matches", "teams", column: "team2_id"
  add_foreign_key "matches", "teams", column: "toss_winer_team_id"
  add_foreign_key "matches", "teams", column: "winner_team_id"
  add_foreign_key "overs", "innings"
  add_foreign_key "overs", "players", column: "bowler_id"
  add_foreign_key "overs", "players", column: "non_strick_batsman_id"
  add_foreign_key "overs", "players", column: "strick_batsman_id"
  add_foreign_key "players", "users"
  add_foreign_key "teams", "players", column: "captain_id"
  add_foreign_key "teams", "players", column: "vice_captain_id"
  add_foreign_key "users", "roles"
end
