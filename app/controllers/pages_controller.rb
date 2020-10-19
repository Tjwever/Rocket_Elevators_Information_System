class PagesController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:home, :commercial, :residential]
    def index
    end
end
