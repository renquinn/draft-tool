require 'csv'

class Team < ActiveRecord::Base
  belongs_to :user
  has_many :players
  attr_accessible :name, :user

  after_create :build_players

  def build_players
    rows = CSV.read("public/players.csv")
    rows.each_with_index do |row, i|
      unless i == 0 || row[1].include?("D/ST")
        p = Player.new
        p.team_id = id

        p_info = row[1].split ","
        p.name = p_info.first
        p.nfl_team = p_info.second.split.first
        p.position = p_info.second.split.second

        ca = row[2].split "/"
        p.completions = ca.first
        p.attempts = ca.last
        p.passing_yards = row[3]
        p.passing_touchdowns = row[4]
        p.interceptions = row[5]

        p.rushes = row[6]
        p.rushing_yards = row[7]
        p.rushing_touchdowns = row[8]

        p.receptions = row[9]
        p.receiving_yards = row[10]
        p.receiving_touchdowns = row[11]

        p.save
      end
    end
  end
end
