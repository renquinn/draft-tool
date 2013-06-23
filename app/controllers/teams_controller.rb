class TeamsController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    params[:team][:user] = current_user
    super
  end

  def begin_of_association_chain
    current_user
  end
end
