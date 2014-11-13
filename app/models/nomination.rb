class Nomination < ActiveRecord::Base
  has_many :restaurants

  def self.get_nominations
    @sql = "
        SELECT n.* 
        FROM nominations n, restaurants r 
        WHERE n.restaurant_id = r.id 
            AND (n.created_at BETWEEN ? AND ?) 
        ORDER BY r.name"

    @nominations = Nomination.find_by_sql [@sql, Time.new(Time.now.year), Time.new(Time.now.year + 1)]
  end

  def self.get_restaurant_id_by_nomination_id(nomination_id)
    @nomination = Nomination.find(nomination_id)
  end
end
