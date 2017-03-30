class Finance < ApplicationRecord
	validates_presence_of :year, :month, :payment_due
end
