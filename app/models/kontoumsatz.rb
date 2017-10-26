class Kontoumsatz < ApplicationRecord
	def self.import(file)
		CSV.foreach(file.path, headers: true, col_sep: ';') do |row|
			Kontoumsatz.create! row.to_hash
		end
	end
end
