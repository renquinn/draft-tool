class Player < ActiveRecord::Base
  belongs_to :team, :dependent => :destroy
  # attr_accessible :title, :body
end
