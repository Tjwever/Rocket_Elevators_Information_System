class Employee < ApplicationRecord
    include RailsAdminDynamicCharts::Datetime
    has_one :user
end
