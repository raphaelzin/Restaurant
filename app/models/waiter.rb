class Waiter < ActiveRecord::Base
	has_many :tables

	has_secure_password
end
