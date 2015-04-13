class Client < ActiveRecord::Base
  belongs_to :table
  has_and_belongs_to_many :dishes

  def owe
  	total = 0
  	dishes.each do |d|
  		total += d.price
  	end
  	total
  end
end
