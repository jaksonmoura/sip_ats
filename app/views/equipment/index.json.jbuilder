json.array!(@equipment) do |equipment|
  json.extract! equipment, :dpto_id, :subdpto_id, :type
  json.url equipment_url(equipment, format: :json)
end
