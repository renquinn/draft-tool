class PlayersController < InheritedResources::Base
  def mark_selected
    @player = Player.find(params[:id])
    @player.mark_selected!
    redirect_to team_path(@player.team)
  end

  def mark_unselected
    @player = Player.find(params[:id])
    @player.mark_unselected!
    redirect_to team_path(@player.team)
  end
end

