class FinancesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_finance, only: [:show, :edit, :update, :destroy]
	def index
		@finances = Finance.all	
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


	def edit
		
	end

	def update

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
