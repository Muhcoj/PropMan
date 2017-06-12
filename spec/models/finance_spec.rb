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

  	it "cannot be created without a year, month and payment_due" do
  		@finance.year = nil
  		@finance.month = nil
  		@finance.payment_due = nil
  		expect(@finance).to_not be_valid
  	end
  end
end
