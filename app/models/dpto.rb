class Dpto < ActiveRecord::Base
	has_many :subdptos
	has_many :computers
	has_many :equipments
end
