class FinancesController < ApplicationController
	def index
		
	end

	def new
		@finance = Finance.new
	end

	def create
		@finance = Finance.new(params.require(:finance).permit(:year, :month, :payment_due))
    
    @finance.save

    redirect_to @finance
	end

	def show
		@finance = Finance.find(params[:id])
	end
end
