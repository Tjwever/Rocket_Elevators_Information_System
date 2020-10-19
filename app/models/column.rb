class Column < ApplicationRecord
    belongs_to :Battery
    has_many :Elevator
end
