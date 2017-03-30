require 'rails_helper'

RSpec.describe Finance, type: :model do
  describe "Creation" do
		before do
			@finance = Finance.create( year: "2017", month: "January", gas: 1123456.4, water: 271638389.37, electricity: 2873840.2, payment_due: 45.80 )
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
