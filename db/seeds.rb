100.times do |finance|
	Finance.create!(year: "#{finance} year", month: "#{finance} month", payment_due: 45.80)
end

puts "100 Finances have been created"
