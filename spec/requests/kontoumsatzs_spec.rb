require 'rails_helper'

RSpec.describe "Kontoumsatzs", type: :request do
  describe "GET /kontoumsatzs" do
    it "works! (now write some real specs)" do
      get kontoumsatzs_path
      expect(response).to have_http_status(200)
    end
  end
end
