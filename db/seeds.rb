# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


10.times do |counter|
  user = FactoryBot.create(:user)
  FactoryBot.create(:player, user: user)
end

10.times do |counter|
  team = FactoryBot.create(:team)
  FactoryBot.create(:player, captain: User.find(counter))
end

match1 = FactoryBot.create(:match,
  team1: Team.last,
  team2: Team.first,
  toss_winer_team: Team.last
)

match2 = FactoryBot.create(:match,
  team1: Team.last,
  team2: Team.first,
  toss_winer_team: Team.last
)
