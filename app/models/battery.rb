class Battery < ApplicationRecord
    belongs_to :Building
    has_many :Column
    
end
