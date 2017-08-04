class StaticController < ApplicationController
  def homepage
  	@home_posts = HomePost.all  
  end

  def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  ActionMailer::Base.mail(from: @email,
	      to: 'jochum.de.bueger@gmail.com',
	      subject: "A new contact form message from #{@name}",
	      body: @message).deliver_now
	end
end