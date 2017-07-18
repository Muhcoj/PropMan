class FinancesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_finance, only: [:show, :edit, :update, :destroy, :paid]

	def index
		if admin_types.include?(current_user.type)
			@admin_finance = Finance.all
		else
			@finances = Finance.finances_by(current_user).page(params[:page]).per(8)
		end
	end

	def paid
		authorize @finance
		@finance.paid!
		@finance = Finance.find(params[:id])
		@user = @finance.user(params[:id])
	  if user_signed_in?  
	    UserMailer.invoice_paid(@user, @finance).deliver  
	    redirect_to posts_url, notice: "The payment has been approved"  
	  else  
	  end
	end


	def new
		@finance = Finance.new
	end

	def create
		@finance = Finance.new(finance_params)
		@user = @finance.user(params[:id])

    if @finance.save
    	redirect_to @finance, notice: 'Your invoice was created successfully'
    	UserMailer.new_invoice(@user, @finance).deliver
    else
    	render :new
    end
	end

	def send_invoice_reminder
		@finance = Finance.find(params[:id])
		@user = @finance.user(params[:id])
	  if user_signed_in?  
	    UserMailer.invoice_reminder(@user, @finance).deliver  
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
		authorize @finance
	end

	def destroy
		@finance.delete
		redirect_to finances_path, notice: 'Your post was deleted successfully'
	end

	private

		def finance_params
			params.require(:finance).permit(:year, :month, :payment_due, :user_id, :status)
		end

		def set_finance
			@finance = Finance.find(params[:id])
		end
end
