json.array!(@subdptos) do |subdpto|
  json.extract! subdpto, :name, :dpto_id
  json.url subdpto_url(subdpto, format: :json)
end
