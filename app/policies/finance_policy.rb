class FinancePolicy < ApplicationPolicy

	def update?
		record.user_id == user.id || admin_types.include?(user.type)
	end

	def paid?
		admin?
	end

	private

		def admin?
			admin_types.include?(user.type)
		end
end