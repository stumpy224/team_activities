class PagesController < ApplicationController
    def results
        puts "HERE"
    end

  def submit_votes
    params.delete('action')
    params.delete('controller')
    member_id = params.delete('member_id')

    if Vote.has_member_already_voted(member_id)
        # respond_to do |format|
        #   format.js {render inline: "location.reload();" }
        # end
        
        # flash.now[:danger] = 'A team member can only vote once.'
        # render js: "alert('" + root_url + "');"
      # redirect_to root_url
      # render partial: 'modal_member_already_voted'

      respond_to do |format|
        format.js { render js: "showMemberAlreadyVotedModal();" }
      end
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

        render :results
    end
  end
end
