require 'rails_helper'

describe 'navigate'  do
	before do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)
	end

	describe 'index' do
		before do
			visit posts_path
		end
		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a list of posts' do
			post1 = Post.create(title: "Some Title", date: Date.today, description: "Some description post1")
			post2 = Post.create(title: "Some Title", date: Date.today, description: "Some description post2")
			visit posts_path
			expect(page).to have_content(/post1|post2/)
		end
	end

	describe 'new' do 
		it 'has a link to the new form' do
			visit root_path

			click_link("new_post_from_nav")
			expect(page.status_code).to eq(200)
		end
	end

	describe 'Creation' do
		before do
			visit new_post_path
		end
		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'post[title]', with: "Some title"
      fill_in 'post[description]', with: "Some description asdfasdfasdf"
      click_on "Save"

      expect(page).to have_content("Some description")
		end
	end
end 