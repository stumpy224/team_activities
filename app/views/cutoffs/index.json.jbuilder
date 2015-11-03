json.array!(@cutoffs) do |cutoff|
  json.extract! cutoff, :id, :cutoff_at
  json.url cutoff_url(cutoff, format: :json)
end
