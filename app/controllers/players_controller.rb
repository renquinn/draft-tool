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

  def mark_removed
    @player = Player.find(params[:id])
    @player.mark_removed!
    redirect_to team_path(@player.team)
  end

  def mark_unremoved
    @player = Player.find(params[:id])
    @player.mark_unremoved!
    redirect_to team_path(@player.team)
  end

  def mark_marked
    @player = Player.find(params[:id])
    @player.mark_marked!
    redirect_to team_path(@player.team)
  end

  def mark_unmarked
    @player = Player.find(params[:id])
    @player.mark_unmarked!
    redirect_to team_path(@player.team)
  end
end

