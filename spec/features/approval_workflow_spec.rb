require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @finance = FactoryGirl.create(:finance)
      visit edit_finance_path(@finance)
    end

    it 'has a status that can be edited on the form by an admin' do
      choose('finance_status_paid')
      click_on "Save"

      expect(@finance.reload.status).to eq('paid')
    end

    it 'cannot be edited by a non admin' do
    	logout(:user)
    	user = FactoryGirl.create(:user)
    	login_as(user, :scope => :user)

    	visit edit_finance_path(@finance)

    	expect(page).to_not have_content('paid')
    end
  end
end