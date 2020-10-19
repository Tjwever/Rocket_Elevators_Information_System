class Building < ApplicationRecord
    belongs_to :Customer
    has_many :Battery
end
