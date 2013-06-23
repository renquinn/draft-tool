class TeamsController < InheritedResources::Base
  has_scope :for_user, :using => current_user.id

  def create
    #params[:team][:user] = User.find(params[:team][:user])
    params[:team][:user] = current_user
    super
  end
end
