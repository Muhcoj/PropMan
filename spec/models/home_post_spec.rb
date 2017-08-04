require 'rails_helper'

RSpec.describe HomePost, type: :model do
  describe 'creation' do
    before do
      @home_post = FactoryGirl.create(:home_post)
    end

    it 'can be created' do
      expect(@home_post).to be_valid
    end

    it 'cannot be created without title and description' do
  		@home_post.title = nil
  		@home_post.description = nil
  		expect(@home_post).to_not be_valid
  	end
  end
end