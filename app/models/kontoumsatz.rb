class Kontoumsatz < ApplicationRecord

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |kontoumsatz|
				csv << kontoumsatz.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true, col_sep: ';') do |row|
			Kontoumsatz.create! row.to_hash
		end
	end
end
