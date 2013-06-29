class Player < ActiveRecord::Base
  belongs_to :team, :dependent => :destroy
  # attr_accessible :title, :body

  scope :selected, where(:selected => true)
  scope :unselected, where(:selected => false)
  scope :qb, where(:position => "QB")
  scope :rb, where(:position => "RB")
  scope :wr, where(:position => "WR")
  scope :te, where(:position => "TE")
  scope :k, where(:position => "K")
  scope :dst, where(:position => "D/ST")

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

  def mark_selected!
    self.selected = true
    save!
  end

  def mark_unselected!
    self.selected = false
    save!
  end

  def mark_removed!
    self.removed = true
    save!
  end

  def mark_unremoved!
    self.removed = false
    save!
  end

  def mark_marked!
    self.marked = true
    save!
  end

  def mark_unmarked!
    self.marked = false
    save!
  end

  def self.order_by(column, players)
    column ||= "rank"

    case column
    when "points"
      players = players.sort { |a,b| b.calculate_score <=> a.calculate_score }
    when "rank"
      players = players.sort { |a,b| a.rank <=> b.rank }
    when "name"
      players = players.sort { |a,b| a.name <=> b.name }
    when "nfl_team"
      players = players.sort { |a,b| a.nfl_team <=> b.nfl_team }
    when "completions"
      players = players.sort { |a,b| b.completions <=> a.completions }
    when "attempts"
      players = players.sort { |a,b| b.attempts <=> a.attempts }
    when "passing_yards"
      players = players.sort { |a,b| b.passing_yards <=> a.passing_yards }
    when "passing_touchdowns"
      players = players.sort { |a,b| b.passing_touchdowns <=> a.passing_touchdowns }
    when "interceptions"
      players = players.sort { |a,b| a.interceptions <=> b.interceptions }
    when "rushes"
      players = players.sort { |a,b| b.rushes <=> a.rushes }
    when "rushing_yards"
      players = players.sort { |a,b| b.rushing_yards <=> a.rushing_yards }
    when "rushing_touchdowns"
      players = players.sort { |a,b| b.rushing_touchdowns <=> a.rushing_touchdowns }
    when "receptions"
      players = players.sort { |a,b| b.receptions <=> a.receptions }
    when "receiving_yards"
      players = players.sort { |a,b| b.receiving_yards <=> a.receiving_yards }
    when "receiving_touchdowns"
      players = players.sort { |a,b| b.receiving_touchdowns <=> a.receiving_touchdowns }
    end

    players
  end

  def table_row_classes
    classes = ""
    unless selected?
      if removed?
        classes += "error"
      elsif marked?
        classes += "success"
      end
    end

    classes
  end
end
