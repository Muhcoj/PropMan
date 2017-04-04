class FinancesController < ApplicationController
	before_action :set_finance, only: [:show]
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

	def show
	end

	private

		def finance_params
			params.require(:finance).permit(:year, :month, :payment_due)
		end

		def set_finance
			@finance = Finance.find(params[:id])
		end
end
