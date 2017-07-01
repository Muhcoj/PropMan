class FinancesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_finance, only: [:show, :edit, :update, :destroy, :paid]

	def index
		@finances = Finance.finances_by(current_user).page(params[:page]).per(8)
	end

	def paid
		authorize @finance
		@finance.paid!
		redirect_to posts_url, notice: "The payment has been approved"
	end


	def new
		@finance = Finance.new
	end

	def create
		@finance = Finance.new(finance_params)
		@finance.user_id = current_user.id
    
    if @finance.save
    	redirect_to @finance, notice: 'Your post was created successfully'
    else
    	render :new
    end
	end

	def send_invoice_reminder
		@user = current_user  
  	@finance = Finance.find(params[:id])  #The culprit!  
	  if user_signed_in?  
	    UserMailer.invoice_reminder(current_user, @finance).deliver  
	    redirect_to posts_url, notice: 'Reminder has been sent.'  
	  else  
	  end 
	end


	def edit
		authorize @finance
	end

	def update
		authorize @finance

		if @finance.update(finance_params)
			redirect_to @finance, notice: 'Your post was created successfully'
		else
			render :edit
		end
	end


	def show
	end

	def destroy
		@finance.delete
		redirect_to finances_path, notice: 'Your post was deleted successfully'
	end

	private

		def finance_params
			params.require(:finance).permit(:year, :month, :payment_due, :status)
		end

		def set_finance
			@finance = Finance.find(params[:id])
		end
end
