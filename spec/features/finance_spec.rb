require 'rails_helper'

describe 'navigate' do
	before do
		@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Santa", last_name: "Claus")
		login_as(@user, :scope => :user)
	end

	describe 'index' do
		before do
			visit finances_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Finance' do
			expect(page).to have_content(/Finance/)
		end

		it 'has a list of finances' do
			finance1 = Finance.create( year: "2017", month: "January", gas: 1123456.4, water: 271638389.37, electricity: 2873840.2, payment_due: 40.50, user_id: @user.id )
			finance2 = Finance.create( year: "2016", month: "January", gas: 1123456.4, water: 271638389.37, electricity: 2873840.2, payment_due: 45.80, user_id: @user.id )
			visit finances_path
			expect(page).to have_content(/2017|2016/)
		end
	end

	describe 'creation' do
		before do
			@user = User.create(email: "test2@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Santa", last_name: "Claus")
			login_as(@user, :scope => :user)
			visit new_finance_path
		end

		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
      fill_in 'finance[year]', with: "2017"
      fill_in 'finance[month]', with: "January"
      fill_in 'finance[payment_due]', with: 40.45
      click_on "Save"

      expect(page).to have_content("2017")
		end

		it 'will have a user associated with it' do
			fill_in 'finance[year]', with: "2017"
      fill_in 'finance[month]', with: "January"
      fill_in 'finance[payment_due]', with: 45.40
      click_on "Save"

      expect(User.last.finances.last.month).to eq("January")
		end
	end
end