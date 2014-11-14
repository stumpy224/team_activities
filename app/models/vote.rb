class Vote < ActiveRecord::Base
  validates_presence_of :member_id, :nomination_id, :points

  def self.has_member_already_voted(member_id)
    @votes = Vote.where("(created_at between ? and ?) and member_id = ?", 
      Time.new(Time.now.year), Time.new(Time.now.year + 1), member_id)
    @votes.any?
  end

  def self.get_results
    @results = Vote.select("nomination_id, sum(points) as points")
      .where("created_at between ? and ?", Time.new(Time.now.year), Time.new(Time.now.year + 1))
      .group("nomination_id").order("points DESC")
  end
end
