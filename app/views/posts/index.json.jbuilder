json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :from_name, :from_id, :message, :link, :facebook_id, :facebook_created_time
  json.url post_url(post, format: :json)
end
