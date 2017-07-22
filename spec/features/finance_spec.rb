require 'rails_helper'

describe 'navigate' do
	let(:user) { FactoryGirl.create(:user) }

	let(:finance) do 
		Finance.create( date: Date.today, payment_due: 48.50, user_id: user.id)
	end

	before do
		login_as(user, :scope => :user)
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
			finance2 = FactoryGirl.create(:second_finance, user_id: user.id) #FactoryGirl factories need to be instantiated and need to have the user_if manually defined.
			#finance2.update!(user_id: @user.id)
			visit finances_path
			expect(page).to have_content(/January|February/)
		end

		it 'has a scope so that only finance creators can see their finances' do
    	other_user = User.create(first_name: "Non", last_name: "Authorized", email: "test.test.com", password: "asdfasdf", password_confirmation: "asdfasdf" )
			
			finance_from_other_user = Finance.create( date: Date.today, payment_due: 48.50, user_id: other_user.id )

			visit finances_path
			
			expect(page).to_not have_content(/December/)
		end
	end

	describe 'new' do
		it 'has a link from the homepage' do
			logout(:user)
			admin_user = FactoryGirl.create(:admin_user)
			login_as(admin_user, :scope => :user)
			visit finances_path
			click_link("new_finance_from_nav")
			expect(page.status_code).to eq(200) 
		end
	end

	describe 'delete' do
		it 'can be deleted' do
			logout(:user)

			delete_user = FactoryGirl.create(:user)
			login_as(delete_user, :scope => :user)

			finance_to_delete = Finance.create( date: Date.today, payment_due: 48.50, user_id: delete_user.id )

			visit finances_path

			click_link("delete_post_#{finance_to_delete.id}_from_index")
			expect(page.status_code).to eq(200)
		end
	end

	describe 'creation' do
		before do
			admin_user = FactoryGirl.create(:admin_user)
			login_as(admin_user, :scope => :user)
			visit new_finance_path
		end

		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
      fill_in 'finance[year]', with: "2017"
      fill_in 'finance[month]', with: "January"
      fill_in 'finance[payment_due]', with: 40.50
      click_on "Save"

      expect(page).to have_content("2017")
		end

		it 'will have a user associated with it' do
			fill_in 'finance[year]', with: "2017"
      fill_in 'finance[month]', with: "January"
      fill_in 'finance[payment_due]', with: 40.50
      click_on "Save"

      expect(User.last.finances.last.month).to eq("January")
		end
	end

	describe 'edit' do
		it 'can be edited' do
			visit edit_finance_path(finance)

			fill_in 'finance[gas]', with: 12345.63
      fill_in 'finance[water]', with: 12345.63
      fill_in 'finance[electricity]', with: 12345.63
      click_on "Save"

      expect(page).to have_content("open")
		end

		it 'cannot be edited by a non authorized user' do
			logout(:user)
			non_authorized_user = FactoryGirl.create(:non_authorized_user)
			login_as(non_authorized_user, :scope => :user)

			visit edit_finance_path(finance)

			expect(current_path).to eq(posts_path)
		end
	end
end