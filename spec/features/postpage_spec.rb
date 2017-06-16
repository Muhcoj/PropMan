require 'rails_helper'

describe 'Postpage' do
	it 'allows the admin to approve open finance from the postpage' do
		finance = FactoryGirl.create(:finance)
		admin_user = FactoryGirl.create(:admin_user)
		login_as(admin_user, :scope => :user)

		visit posts_path

		click_on("paid_#{finance.id}")
	
		expect(finance.reload.status).to eq('paid')
	end
end