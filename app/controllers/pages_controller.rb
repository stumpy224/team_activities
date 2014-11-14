class PagesController < ApplicationController
  def results
    @meals = Meal.all
    @nominations = Nomination.all
    @votes = Vote.get_results
  end

  def submit_votes
    params.delete('action')
    params.delete('controller')
    member_id = params.delete('member_id')
    dinner_indicator = params.delete('dinner_indicator')

    if Vote.has_member_already_voted(member_id)
      render js: "showInformativeModal('A team member can only vote once.', 'Close');"
    else
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

        vote += 1
      end

      Meal.create(
        member_id: member_id,
        dinner_indicator: dinner_indicator
      )

      render js: "window.location = '/results';"
    end
  end
end
