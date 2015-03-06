namespace :poll_api do
  desc "TODO"
  task facebook: :environment do

    # Your code goes here.

    # For each of our users,
      # poll facebook for their home feed
      # for each post,
        # if it is a video
          # create a row in our Post table
          # fill in all 7 columns
          # save


    User.all.each do |user|
      g = Koala::Facebook::API.new(user.facebook_access_token)

      post_hashes = g.get_connections("me", "home", limit: 200).select { |p| p["type"] == "video" }

      post_hashes.each do |post_hash|
        post = Post.new
        post.user = user
        post.from_name = post_hash["from"]["name"]
        post.from_id = post_hash["from"]["id"]
        post.message = post_hash["message"]
        post.link = post_hash["link"]
        post.facebook_id = post_hash["id"]
        post.facebook_created_time = post_hash["created_time"]
        post.save
      end
    end

    # rake poll_api:facebook

    # t.integer  "user_id"
    # t.string   "from_name"
    # t.string   "from_id"
    # t.string   "message"
    # t.string   "link"
    # t.string   "facebook_id"
    # t.datetime "facebook_created_time"

  end

  desc "TODO"
  task twitter: :environment do
  end

end
