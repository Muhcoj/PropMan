class Finance < ApplicationRecord
	belongs_to :user
	validates_presence_of :year, :month, :payment_due
end
