class Player < ActiveRecord::Base
  belongs_to :team, :dependent => :destroy
  # attr_accessible :title, :body

  def calculate_score
    score = 0
    score += attempts * team.team_setting.attempts
    score += completions * team.team_setting.completions
    score += passing_yards * team.team_setting.passing_yards
    score += passing_touchdowns * team.team_setting.passing_touchdowns
    score += interceptions * team.team_setting.interceptions
    score += rushes * team.team_setting.rushes
    score += rushing_yards * team.team_setting.rushing_yards
    score += rushing_touchdowns * team.team_setting.rushing_touchdowns
    score += receptions * team.team_setting.receptions
    score += receiving_yards * team.team_setting.receiving_yards
    score += receiving_touchdowns * team.team_setting.receiving_touchdowns
    score.truncate
  end
end
