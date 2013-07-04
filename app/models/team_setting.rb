class TeamSetting < ActiveRecord::Base
  belongs_to :team
  attr_accessible :attempts, :completions, :interceptions, :passing_touchdowns, :passing_yards, :receiving_touchdowns, :receiving_yards, :receptions, :rushes, :rushing_touchdowns, :rushing_yards, :qb_points, :rb1_points, :rb2_points, :wr1_points, :wr2_points, :flex_points, :te_points, :k_points, :dst_points

  before_save :set_ideal_total

  def set_ideal_total
    self.total_points = calculate_ideal_total
  end

  def calculate_ideal_total
    [qb_points,
      rb1_points,
      rb2_points,
      wr1_points,
      wr2_points,
      flex_points,
      te_points,
      k_points,
      dst_points].reduce(:+)
  end
end
