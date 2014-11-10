class Vote < ActiveRecord::Base
  validates_presence_of :member_id, :nomination_id, :points

  def self.get_nominations
    @sql = "
        SELECT n.* 
        FROM nominations n, restaurants r 
        WHERE n.restaurant_id = r.id 
            AND (n.created_at BETWEEN ? AND ?) 
        ORDER BY r.name"

    @nominations = Nomination.find_by_sql [@sql, Time.new(Time.now.year), Time.new(Time.now.year + 1)]
  end

  def self.has_member_already_voted(member_id)
    @sql = "
        SELECT v.* 
        FROM votes v
        WHERE (v.created_at BETWEEN ? AND ?)
          AND v.member_id = ?"

    @votes = Vote.find_by_sql [@sql, Time.new(Time.now.year), Time.new(Time.now.year + 1), member_id]
    @votes.any?
  end

  def self.get_results

  end
end
