require 'rails_helper'

describe 'navigate' do
	describe 'index' do
		it 'can be reached successfully' do
			visit finances_path
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Finance' do
			visit finances_path
			expect(page).to have_content(/Finance/)
		end
	end

	describe 'creation' do
		it 'has a new form that can be reached' do
			visit new_finance_path
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			visit new_finance_path

      fill_in 'finance[year]', with: "2017"
      fill_in 'finance[month]', with: "January"
      fill_in 'finance[payment_due]', with: 40.45

      click_on "Save"

      expect(page).to have_content("2017")
		end
	end
end