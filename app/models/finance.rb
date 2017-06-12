class Finance < ApplicationRecord
	enum status: { open: 0, paid: 1 }
	belongs_to :user
	validates_presence_of :year, :month, :payment_due

	scope :finances_by, ->(user) { where(user_id: user.id) }
end
