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

    settings.qb_points = App.default_settings[:qb_points]
    settings.rb1_points = App.default_settings[:rb1_points]
    settings.rb2_points = App.default_settings[:rb2_points]
    settings.wr1_points = App.default_settings[:wr1_points]
    settings.wr2_points = App.default_settings[:wr2_points]
    settings.flex_points = App.default_settings[:flex_points]
    settings.te_points = App.default_settings[:te_points]
    settings.k_points = App.default_settings[:k_points]
    settings.dst_points = App.default_settings[:dst_points]

    settings.save
  end

  def projected_score
    score = 0
    players.selected.each do |player|
      score += player.calculate_score
    end
    score
  end

  def ideal_points
      [team_setting.qb_points,
      team_setting.rb1_points,
      team_setting.rb2_points,
      team_setting.wr1_points,
      team_setting.wr2_points,
      team_setting.flex_points,
      team_setting.te_points,
      team_setting.k_points,
      team_setting.dst_points,
      team_setting.total_points]
  end

  def starters
    scores = [starting_qb_points,
      starting_rb1_points,
      starting_rb2_points,
      starting_wr1_points,
      starting_wr2_points,
      starting_flex_points,
      starting_te_points,
      starting_k_points,
      starting_dst_points]
    total = scores.reduce(:+)
    scores << total
  end

  def starting_qb_points
    qb = Player.order_by("points", players.selected.qb).first
    qb.nil? ? 0 : qb.calculate_score / 15
  end

  def starting_rb1_points
    rb = Player.order_by("points", players.selected.rb).first
    rb.nil? ? 0 : rb.calculate_score / 15
  end

  def starting_rb2_points
    rb = Player.order_by("points", players.selected.rb).second
    rb.nil? ? 0 : rb.calculate_score / 15
  end

  def starting_wr1_points
    wr = Player.order_by("points", players.selected.wr).first
    wr.nil? ? 0 : wr.calculate_score / 15
  end

  def starting_wr2_points
    wr = Player.order_by("points", players.selected.wr).second
    wr.nil? ? 0 : wr.calculate_score / 15
  end

  def starting_flex_points
    rb = Player.order_by("points", players.selected.rb).third
    wr = Player.order_by("points", players.selected.wr).third
    [rb.nil? ? 0 : rb.calculate_score / 15, wr.nil? ? 0 : wr.calculate_score / 15].max
  end

  def starting_te_points
    te = Player.order_by("points", players.selected.te).first
    te.nil? ? 0 : te.calculate_score / 15
  end

  def starting_k_points
    k = Player.order_by("points", players.selected.k).first
    k.nil? ? 0 : k.calculate_score / 15
  end

  def starting_dst_points
    dst = Player.order_by("points", players.selected.dst).first
    dst.nil? ? 0 : dst.calculate_score / 15
  end

  def self.plus_minus_ideal_points(ideal, starters)
    drafted_ideal = 0
    drafted_actual = 0
    diffs = []
    ideal.each_with_index do |p, i|
      diffs << starters[i] - p
      if starters[i] != 0 && p < 50
        drafted_ideal += p
        drafted_actual += starters[i]
      end
    end

    diffs << drafted_actual - drafted_ideal

    diffs.map do |d|
      if d < 0
        "<span class=\"text-error\">-#{d}</span>".html_safe
      elsif d > 0
        "<span class=\"text-success\">+#{d}</span>".html_safe
      else
        "<span class=\"muted\">#{d}</span>".html_safe
      end
    end
  end

  def self.sorting_css(session_sort, column)
    column == session_sort ? "label label-info" : ""
  end
end
