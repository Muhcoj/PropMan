class UserMailer < ApplicationMailer
	def new_invoice (user, finance)
		@user = user
		@finance = finance
		mail(from: 'jochum.de.bueger@gmail.com', to: @user.email, subject: 'You have a new open invoice from Sudetenlandweg, Sankt Andreasberg.').deliver_now
	end

	def invoice_paid (user, finance)
		@user = user
		mail(from: 'jochum.de.bueger@gmail.com', to: @user.email, subject: 'Your invoice from Sudetenlandweg, Sankt Andreasberg.').deliver_now
	end

	def invoice_reminder (user, finance)
		@user = user
		@finance = finance
		mail(from: 'jochum.de.bueger@gmail.com', to: @user.email, subject: 'Your invoice from Sudetenlandweg, Sankt Andreasberg.').deliver_now
	end

end
