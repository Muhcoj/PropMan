require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit home_posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a list of posts' do
			homepost1 = HomePost.create(title: "Some Title", date: Date.today, description: "Some description post1")
			homepost2 = HomePost.create(title: "Some Title", date: Date.today, description: "Some description post2")
			visit root_path
			expect(page).to have_content(/post1|post2/)
		end
  end

  describe 'new' do 
		it 'has a link to the new form' do
			admin_user = FactoryGirl.create(:admin_user)
			login_as(admin_user, :scope => :user)
			visit new_post_path

			click_link('new_home_post')
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

	# describe 'Edit' do
	# 	before do
	# 		logout(:user)
	# 		admin_user = FactoryGirl.create(:admin_user)
	# 		login_as(admin_user, :scope => :user)
	# 		visit new_post_path
	# 	end

	# 	it 'can be reached by clicking edit on index page' do
	# 		post = FactoryGirl.create(:post)
	# 		visit posts_path

	# 		click_link 'Edit'
	# 		expect(page.status_code).to eq(200)
	# 	end
	# end
end
