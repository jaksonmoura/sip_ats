json.array!(@users) do |user|
  json.extract! user, :nickname, :name
  json.url user_url(user, format: :json)
end
