require "rails_helper"

RSpec.describe KontoumsatzsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/kontoumsatzs").to route_to("kontoumsatzs#index")
    end

    it "routes to #new" do
      expect(:get => "/kontoumsatzs/new").to route_to("kontoumsatzs#new")
    end

    it "routes to #show" do
      expect(:get => "/kontoumsatzs/1").to route_to("kontoumsatzs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/kontoumsatzs/1/edit").to route_to("kontoumsatzs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/kontoumsatzs").to route_to("kontoumsatzs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/kontoumsatzs/1").to route_to("kontoumsatzs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/kontoumsatzs/1").to route_to("kontoumsatzs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/kontoumsatzs/1").to route_to("kontoumsatzs#destroy", :id => "1")
    end

  end
end
