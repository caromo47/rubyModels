class Dojo < ActiveRecord::Base
	has_many :students, dependent: :destroy 
	validates :branch, :street, :state, presence: true
	validates :state, length: {is: 2}
end
