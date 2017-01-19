class Dojo < ActiveRecord::Base
	has_many :ninjas, :dependent => :destroy
	validates :name, :city, presence: true
	validates :state, presence: true, length: {in: 2..3}

end
