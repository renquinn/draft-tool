class Team < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user
  scope :for_user, lambda { |user_id| where(:user_id => user_id) }
end
