module VotesHelper
  # a simple helper function to return the average number of votes for an array
  def average_vote(votes)
    return '' unless votes.count > 0
    
    total = votes.sum(:value)
    average = Float(total) / votes.count
    'Average: ' + number_to_human(average)
  end
end
