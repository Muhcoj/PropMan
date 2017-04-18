require 'rails_helper'

describe 'navigate'  do
	before do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)
	end

	describe 'index' do
		it 'can be reached successfully' do
			visit posts_path
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Posts' do
			visit posts_path
			expect(page).to have_content(/Posts/)
		end
	end

	describe 'Creation' do
		it 'has a new form that can be reached' do
			visit new_post_path
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			visit new_post_path
			fill_in 'post[title]', with: "Some title"
      fill_in 'post[description]', with: "Some description asdfasdfasdf"
      click_on "Save"

      expect(page).to have_content("Some description")
		end
	end
end