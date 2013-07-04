class TeamsController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    params[:team][:user] = current_user
    super
  end

  def show
    @team = Team.find(params[:id])
    @ideal_points = @team.ideal_points
    @starters = @team.starters
    @differences = Team.plus_minus_ideal_points(@ideal_points, @starters)
    @players = @team.players
    @selected = @players.selected
    @unselected = @players.unselected
  end

  def begin_of_association_chain
    current_user
  end
end
