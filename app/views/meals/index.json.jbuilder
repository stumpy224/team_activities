json.array!(@meals) do |meal|
  json.extract! meal, :id, :member_id, :dinner_indicator
  json.url meal_url(meal, format: :json)
end
