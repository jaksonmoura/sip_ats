class Computer < ActiveRecord::Base
	belongs_to :dpto
	belongs_to :subdpto
end
