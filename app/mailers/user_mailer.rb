class UserMailer < ApplicationMailer
	def new_invoice (user, finance)
		@user = user
		@finance = finance
		mail(to: @user.email, subject: 'You have a new open invoice from Sudetenlandweg, Sankt Andreasberg.')
	end

	def invoice_paid user 
		@user = user
		mail(to: @user.email, subject: 'Your invoice from Sudetenlandweg, Sankt Andreasberg.')
	end

	def invoice_reminder (user, finance)
		@user = user
		@finance = finance
		mail(to: @user.email, subject: 'Your invoice from Sudetenlandweg, Sankt Andreasberg.')
	end

end
