json.array!(@computers) do |computer|
  json.extract! computer, :dpto_id, :subdpto_id, :sort, :name
  json.url computer_url(computer, format: :json)
end
