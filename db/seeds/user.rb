100.times do |index|
 user = User.new(name: "testuser0#{index}", email: "test-user#{index}@hoge.com", password: 'password')
 user.save!
end
