class Player < ActiveRecord::Base
  self.per_page = 15

  validates :player, presence: true
  validates :longest_rush, presence: true, format: { with: /\A[0-9]+(T)?\z/i, message: "please enter longest_rush in correct format"}

  scope :by_name, lambda {|name|
    where("player like ?", "%#{name}%")
  }

  def self.to_csv
    attributes = self.column_names

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |player|
        csv << attributes.map{ |attr| player.send(attr) }
      end
    end
  end
end
