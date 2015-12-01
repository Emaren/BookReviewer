class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]


  def create

    vote = current_user.votes.new vote_params
    review = Review.find params[:review_id]
    vote.review = review
    vote.user = current_user
      respond_to do |format|
        if @vote.save
          format.html { render }
          format.js   { render :ajax_vote }
        else
          format.html { render }
          format.js   { render :ajax_votefail }
        end
  end

  private

  def vote_params
    params.require(:vote).permit(:is_up)
  end

end
