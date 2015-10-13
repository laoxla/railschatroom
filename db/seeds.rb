
10.times do |n|

 User.create! first_name: Faker::Name.first_name, user_name: Faker::Internet.user_name, last_name: Faker::Name.last_name, email: "example#{n}.com", password: "12345678"

end


users = User.all
 30.times do

   text = Faker::Lorem.sentence(3)
   posted_at = Faker::Time.between(2.days.ago, Time.now, :all)
   railschatroom_id = rand(1..3)
   users.each {|user| user.chats.create!(text: text, posted_at: posted_at, railschatroom_id: railschatroom_id)}

 end

Railschatroom.create! name: "global"
Railschatroom.create! name: "frontend"
Railschatroom.create! name: "backend"
