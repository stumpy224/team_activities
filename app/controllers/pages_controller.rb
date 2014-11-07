class PagesController < ApplicationController
  def vote
    @restaurants = Restaurant.all.order( name: :asc )
  end

  def submit_votes
    # params[:person][:name]
    puts "@ submit_votes"
  end
end
