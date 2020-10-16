class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_filter :verify_authenticity_token
    before_action :authenticate_user!

    def index
    end
end
