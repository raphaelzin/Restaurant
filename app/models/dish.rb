class Dish < ActiveRecord::Base
	belongs_to :category
	has_and_belongs_to_many :clients

	has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
										:default_url => "/images/:style/missing.png",
										:url => "/assets/images/products/:id/:style/:basename.:extension",
										:path => ":rails_root/public/assets/images/products/:id/:style/:basename.:extension"
# :path = where save, :url = where to load
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
end