json.array!(@nominations) do |nomination|
  json.extract! nomination, :id, :restaurant_id, :year
  json.url nomination_url(nomination, format: :json)
end
