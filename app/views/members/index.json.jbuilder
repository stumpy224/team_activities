json.array!(@members) do |member|
  json.extract! member, :id, :identifier, :name, :active
  json.url member_url(member, format: :json)
end
