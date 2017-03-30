class FinancesController < ApplicationController
	def index
		@finance = Finance.new
	end
end
