# frozen_string_literal: true

def create_players
  80.times do |counter|
    FactoryBot.create(:user, :with_player)
    p "============user created #{counter}"
  end
  create_teams
end

def create_teams
  6.times do |counter|
    captain = Player.all.sample
    team = FactoryBot.create(:team, captain: captain)
    p "============team created #{counter}"
    p "============team #{team.inspect}"
  end
  create_match
end

def create_match
  3.times do |counter|
    team1 = Team.all.sample
    team2 = Team.all.sample
    match = FactoryBot.build(:match,
      team1: team1,
      team2: team2,
      toss_winer_team: team2
    )
    p "============match created #{match.valid?}"
    match.save
    p "============match #{match.inspect}"
    create_inning(match)
  end
end

def set_umpire
  @first_umpire = Player.all.sample
  @second_umpire = Player.all.sample
end

def create_inning match
  set_umpire
  if match.status == 'active'
    inning1 = FactoryBot.create(
      :inning,
      match:,
      first_umpire: @first_umpire,
      second_umpire: @second_umpire,
      inning_type: 0,
      bat_team: match.toss_winer_team
    )
    match.number_of_overs.times do |over|
      # start_over(inning1)
      p "Over Number #{over}"
    end

    # inning2 = FactoryBot.create(
    #   :inning,
    #   match:,
    #   first_umpire:,
    #   second_umpire:,
    #   inning_type: 1,
    #   bat_team: match.toss_winer_team
    # )
  end
end

def start_over inning1

end
