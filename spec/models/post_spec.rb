require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
  	before do
  		@post = Post.create(title: "Any title", date: Date.today, description: "Some text")
  	end

  	it 'can be created' do
  		expect(@post).to be_valid
  	end

  	it 'cannot be created without title and description' do
  		@post.title = nil
  		@post.description = nil
  		expect(@post).to_not be_valid
  	end
  end
end
