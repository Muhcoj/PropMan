require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit home_posts_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Creation' do
		before do
			admin_user = FactoryGirl.create(:admin_user)
			login_as(admin_user, :scope => :user)
			visit new_home_post_path
		end
		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'home_post[title]', with: "Some title"
      fill_in 'home_post[description]', with: "Some description asdfasdfasdf"
      click_on "Speichern"

      expect(page).to have_content("Some description")
		end
	end
end
