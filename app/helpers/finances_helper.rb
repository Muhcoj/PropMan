module FinancesHelper
	def status_label status
		status_span_generator status
	end

	private

	def status_span_generator status
		case status
		when 'paid'
			content_tag(:span, status.titleize, class: 'label label-success')
		when 'open'
			content_tag(:span, status.titleize, class: 'label label-danger')
		end
	end
end
