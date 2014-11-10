class PagesController < ApplicationController
  def vote
    @sql = "
        SELECT n.* 
        FROM nominations n, restaurants r 
        WHERE n.restaurant_id = r.id 
            AND (n.created_at BETWEEN ? AND ?) 
        ORDER BY r.name"

    @nominations = Nomination.find_by_sql [@sql, Time.new(Time.now.year), Time.new(Time.now.year + 1)]
  end

  def submit_votes
    params.delete('action')
    params.delete('controller')
    member_id = params.delete('member_id')
    puts "member_id = #{member_id}"

    restaurants = Array.new
    restaurants = params[:restaurant_selections]
    
    vote = 1
    restaurants.each do |r|
        if vote == 1
            points = 3
        elsif vote == 2
            points = 2
        elsif vote == 3
            points = 1
        end
            
        Vote.create(
            member_id: member_id,
            nomination_id: r,
            points: points
        )

        puts "nomination_id = #{r}; points = #{points}"
        vote += 1
    end

    render js: "alert('Hello Rails');"
  end
end
