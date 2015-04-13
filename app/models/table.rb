class Table < ActiveRecord::Base
	
	
	has_many :clients
	belongs_to :waiter

	def owe
		total = 0
		clients.each do |c|
			total += c.owe
		end
		total
	end
end
