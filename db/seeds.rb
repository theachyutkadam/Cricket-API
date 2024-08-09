# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


80.times do |counter|
  FactoryBot.create(:user, :with_player)
  p "============user created #{counter}"
  # FactoryBot.create(:player, user: user)
end

6.times do |counter|
  captain = Player.all.sample
  team = FactoryBot.create(:team, captain: captain)
  p "============team created #{counter}"
end

3.times do |counter|
  team1 = Team.all.sample
  team2 = Team.all.sample
  match = FactoryBot.create(:match,
    team1: team1,
    team2: team2,
    toss_winer_team: team2
  )
  p "============match created #{counter}"
  create_inning(match)
end

def set_umpire
  first_umpire = Player.all.sample
  second_umpire = Player.all.sample
end

def create_inning match
  set_umpire
  if match.status == 'active'
    inning1 = FactoryBot.create(
      :inning,
      match:,
      first_umpire:,
      second_umpire:,
      inning_type: 0,
      bat_team: match.toss_winer_team
    )
    match.number_of_overs.times do |over|
      start_over(inning1)
    end

    inning2 = FactoryBot.create(
      :inning,
      match:,
      first_umpire:,
      second_umpire:,
      inning_type: 1,
      bat_team: match.toss_winer_team
    )
  end
end

def start_over inning1

end
