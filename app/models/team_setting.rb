class TeamSetting < ActiveRecord::Base
  belongs_to :team
  attr_accessible :attempts, :completions, :interceptions, :passing_touchdowns, :passing_yards, :receiving_touchdowns, :receiving_yards, :receptions, :rushes, :rushing_touchdowns, :rushing_yards
end
