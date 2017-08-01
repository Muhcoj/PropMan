require 'rails_helper'

RSpec.describe HomePost, type: :model do
  describe 'creation' do
    before do
      @home_post = FactoryGirl.create(:home_post)
    end

    it 'can be created' do
      expect(@home_post).to be_valid
    end
  end
end