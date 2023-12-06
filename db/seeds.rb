# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


80.times do |counter|
  user = FactoryBot.create(:user)
  p "============user created #{counter}"
  FactoryBot.create(:player, user: user)
end

6.times do |counter|
  captain = Player.all.sample
  team = FactoryBot.create(:team, captain: captain)
  p "============team created #{counter}"
end

3.times do |counter|
  match = FactoryBot.create(:match,
    team1: Team.all.sample,
    team2: Team.all.sample,
    toss_winer_team: Team.all.sample
  )
  p "============match created #{counter}"
end
