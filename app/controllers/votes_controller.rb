class VotesController < ApplicationController
  before_action :is_authenticated
  # POST /votes
  def create
    # new vote is assigned to current_user
    @vote = current_user.ratings.new(vote_params)
    if @vote.save
      redirect_to :back, notice: 'vote cast'
    else
      redirect_to :back, notice: "vote cannot be saved because #{@vote.errors.full_messages.first}"
    end
  end

  def update
    @vote = Vote.find_by(user_id: current_user.id, votable_id: params[:vote][:votable_id], votable_type: params[:vote][:votable_type])
    unless @vote
      return redirect_to :back, notice: 'vote not found.'
    end

    # new vote is assigned to current_user
    if @vote.update(vote_params)
      redirect_to :back, notice: 'vote cast'
    else
      redirect_to :back, notice: "vote cannot be saved because #{@vote.errors.full_messages.first}"
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:value, :votable_id, :votable_type)
    end
end
