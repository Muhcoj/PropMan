@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Santa", last_name: "Claus")

puts "1 user created"

AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Name")

puts "1 Admin User created"

20.times do |post|
	Post.create!(title: 'Mitteilung Titel', date: Date.today, description: "Textbeispiele hier schreiben bitte asdfasdfa sdfasdfasdf asdfa")
end

puts "20 Posts have been created"

20.times do |finance|
	Finance.create!(date: Date.today, payment_due: 45.80, user_id: @user.id)
									# gas: 12345.6, water: 65432.1, electricity: 12345.7, user_id: @user.id)
end

puts "20 Finances have been created"

5.times do |homepost|
  HomePost.create!(title: 'Mitteilung Titel', date: Date.today, description: "Textbeispiele hier schreiben bitte asdfasdfa sdfasdfasdf asdfa")
end

puts "5 HomePosts have been created"
