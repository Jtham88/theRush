class Player < ActiveRecord::Base
  validates :player, presence:true
end