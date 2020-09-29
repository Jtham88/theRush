class Player < ActiveRecord::Base
  validates :player, presence:true
  self.per_page = 20

  scope :by_name, lambda {|name|
    where("player like ?", "%#{name}%")
  }

  def self.to_csv
    # attributes = %w{id email name}
    attributes = self.column_names

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |player|
        csv << attributes.map{ |attr| player.send(attr) }
      end
    end
  end
end
