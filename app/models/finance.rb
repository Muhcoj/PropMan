class Finance < ApplicationRecord
	enum status: { open: 0, paid: 1 }
	belongs_to :user
	#validates_presence_of :gas, :water, :electricity
end
