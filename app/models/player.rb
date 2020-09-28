class Player < ActiveRecord::Base
  validates :player, presence:true
  self.per_page = 20

  scope :by_name, lambda {|name|
    where("player like ?", "%#{name}%")
  }
end
