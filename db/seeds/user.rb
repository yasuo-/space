100.times do |index|
 user = User.new(name: Faker::Name.unique.name, 
                 email: Faker::Internet.email,
                 password: 'password',
                 image: Faker::Avatar.image,
                 uid: Faker::Internet.password)
 user.save!
end
