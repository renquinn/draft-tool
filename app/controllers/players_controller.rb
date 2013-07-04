class PlayersController < InheritedResources::Base
  def toggle_selected
    @player = Player.find(params[:id])
    @player.toggle_selected!
    redirect_to team_path(@player.team)
  end

  def toggle_removed
    @player = Player.find(params[:id])
    @player.toggle_removed!
    render :json => { :player => params[:id], :removed => @player.removed }
  end

  def toggle_marked
    @player = Player.find(params[:id])
    @player.toggle_marked!
    render :json => { :player => params[:id], :marked => @player.marked }
  end
end
