class PagesController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:home, :commercial, :residential, :form]
    def index
    end
end
