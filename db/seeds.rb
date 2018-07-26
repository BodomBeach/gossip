require 'faker'

5.times do
  city = City.create(name: Faker::LeagueOfLegends.location, postcode: Faker::Address.postcode)
end

20.times do
  user = User.new
  user.assign_attributes({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence, email: Faker::Internet.email, age: rand(18..80)})
  user.city = City.all.sample
  user.save
end

10.times do
  tag = Tag.new
  tag.assign_attributes({title: Faker::Color.color_name})
  tag.user = User.all.sample
  tag.save
end

50.times do
  post = Post.new
  post.assign_attributes({title: Faker::Pokemon.name, content: Faker::Lorem.sentence, date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)})
  post.user = User.all.sample
  rand(1..5).times do
    post.tags << Tag.all.sample
  end
  post.save
end

40.times do
  comment = Comment.new
  comment.assign_attributes({content: Faker::Lorem.sentence})
  comment.user = User.all.sample
  comment.post = Post.all.sample
  comment.save
end

r = rand(0..20)

r.times do
  like = Like.new
  like.imageable = Post.all.sample
  like.user = User.all.sample
  like.save
end

(20 - r).times do
  like = Like.new
  like.imageable = Comment.all.sample
  like.user = User.all.sample
  like.save
end

30.times do
  reply = Reply.new
  reply.assign_attributes({content: Faker::Lorem.sentence})
  reply.user = User.all.sample
  reply.repliable = Comment.all.sample
  reply.save
end

20.times do
 pm = PrivateMessage.new
 pm.assign_attributes({content: Faker::Lorem.sentence, date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)})
 pm.sender = User.all.sample
 pm.recipient = User.all.sample
 pm.save
end
