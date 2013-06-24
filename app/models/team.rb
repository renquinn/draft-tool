require 'csv'

class Team < ActiveRecord::Base
  belongs_to :user
  has_many :players
  has_one :team_setting
  attr_accessible :name, :user

  after_create :default_settings
  after_create :build_players

  def build_players
    rows = CSV.read("public/players.csv")
    rows.each_with_index do |row, i|
      unless i == 0
        p = Player.new
        p.team_id = id

        p.rank = row[0]
        if row[1].include?("D/ST")
          p_info = row[1].split
          p.name = p_info.first
          p.nfl_team = ""
          p.position = p_info.second
        else
          p_info = row[1].split ","
          p.name = p_info.first
          p.nfl_team = p_info.second.split.first
          p.position = p_info.second.split.second
        end

        ca = row[2].split "/"
        p.attempts = ca.last
        p.completions = ca.first
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

  def default_settings
    settings = TeamSetting.new
    settings.team_id = id

    settings.attempts = App.default_settings[:attempts]
    settings.completions = App.default_settings[:completions]
    settings.passing_yards = App.default_settings[:passing_yards]
    settings.passing_touchdowns = App.default_settings[:passing_touchdowns]
    settings.interceptions = App.default_settings[:interceptions]

    settings.rushes = App.default_settings[:rushes]
    settings.rushing_yards = App.default_settings[:rushing_yards]
    settings.rushing_touchdowns = App.default_settings[:rushing_touchdowns]

    settings.receptions = App.default_settings[:receptions]
    settings.receiving_yards = App.default_settings[:receiving_yards]
    settings.receiving_touchdowns = App.default_settings[:receiving_touchdowns]

    settings.save
  end
end
