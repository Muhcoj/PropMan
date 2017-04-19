require 'rails_helper'

describe 'navigate' do
	before do
		@user = FactoryGirl.create(:user)
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
			finance1 = FactoryGirl.create(:finance)
			finance2 = FactoryGirl.create(:second_finance, user_id: @user.id) #FactoryGirl factories need to be instantiated and need to have the user_if manually defined.
			#finance2.update!(user_id: @user.id)
			visit finances_path
			expect(page).to have_content(/January|February/)
		end
	end

	describe 'new' do
		it 'has a link from the homepage' do
			visit root_path
			click_link("new_finance_from_nav")
			expect(page.status_code).to eq(200) 
		end
	end

	describe 'delete' do
		it 'can be deleted' do
			@finance = FactoryGirl.create(:finance)
			visit finances_path

			click_link("delete_post_#{@finance.id}_from_index")
			expect(page.status_code).to eq(200)
		end
	end

	describe 'creation' do
		before do
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

	describe 'edit' do
		before do
			@finance = FactoryGirl.create(:finance)
		end

		it 'can be reached by clicking edit on index page' do
			finance = FactoryGirl.create(:finance)
			visit finances_path

			click_link("edit_#{finance.id}")
			expect(page.status_code).to eq(200) 
		end

		it 'can be edited' do
			visit edit_finance_path(@finance)

			fill_in 'finance[year]', with: "2017"
      fill_in 'finance[month]', with: "Edited"
      fill_in 'finance[payment_due]', with: 40.45
      click_on "Save"

      expect(page).to have_content("Edited")
		end
	end
end