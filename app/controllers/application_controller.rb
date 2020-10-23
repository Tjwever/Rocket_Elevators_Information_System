require 'rake'

Rake::Task.clear
RocketElevatorsInformationSystem::Application.load_tasks

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token

    def postgres_update
        Rake::Task["dwhmanager:transfert"].reenable
        Rake::Task["dwhmanager:transfert"].execute
        redirect_to blazer_path
      end 

    def index
    end
   
end

