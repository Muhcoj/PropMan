@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Santa", last_name: "Claus")

puts "1 user created"

100.times do |finance|
	Finance.create!(year: "#{finance} year", month: "#{finance} month", payment_due: 45.80, user_id: @user.id)
end

puts "100 Finances have been created"
