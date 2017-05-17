@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Santa", last_name: "Claus")

puts "1 user created"

AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Name")

puts "1 Admin User created"

100.times do |post|
	Post.create!(title: 'Some title', description: "some description asdfasdfasdf")
end

puts "100 Posts have been created"

100.times do |finance|
	Finance.create!(year: "#{finance} year", month: "#{finance} month", payment_due: 45.80, user_id: @user.id)
									# gas: 12345.6, water: 65432.1, electricity: 12345.7, user_id: @user.id)
end

puts "100 Finances have been created"
