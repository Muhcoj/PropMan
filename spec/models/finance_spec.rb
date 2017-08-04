require 'rails_helper'

RSpec.describe Finance, type: :model do
  describe "Creation" do
		before do
      user = FactoryGirl.create(:user)
			@finance = FactoryGirl.create(:finance)
		end

  	it 'can be created' do
  		expect(@finance).to be_valid
  	end

  	it "cannot be created without a date payment_due" do
  		@finance.date = nil
  		@finance.payment_due = nil
  		expect(@finance).to_not be_valid
  	end
  end
end
