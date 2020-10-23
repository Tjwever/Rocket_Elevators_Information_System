class Building < ApplicationRecord
    belongs_to :customer
    has_many :battery
    has_one :address
end
