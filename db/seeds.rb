# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.count == 0
  def create_user(name, email, password, admin=false)
    User.create!(name: name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 admin: admin,
                 activated: true,
                 activated_at: Time.zone.now)
  end

  create_user("vv", "vv@vv.com", "aaaaaa", true)
  create_user("Example User",
              "example@railstutorial.org",
              "foobar")

  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    create_user(name, email, password)
  end
end

if Micropost.count == 0
  users = User.order(:created_at).take(6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

if Rails.env.development? && Relationship.count == 0
  followers = User.order(:created_at).take(6)
  following = User.order(:created_at).take(10)
  followers.each do |follower|
    following.each do |followed|
    Relationship.create!(follower_id: follower.id, followed_id: followed.id)
    end
  end
end
