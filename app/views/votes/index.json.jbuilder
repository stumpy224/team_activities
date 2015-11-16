json.array!(@votes) do |vote|
  json.extract! vote, :id, :member_id, :nomination_id, :points
  json.url vote_url(vote, format: :json)
end
