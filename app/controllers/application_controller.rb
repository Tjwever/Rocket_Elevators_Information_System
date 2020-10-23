require 'rake'

Rake::Task.clear
RocketElevatorsInformationSystem::Application.load_tasks

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.superadmin_role?
        rails_admin_path
    elsif current_user.employee_role?
        rails_admin_path
    else
        root_path
    end
  end


    def index
    end

    def postgres_update
        Rake::Task["dwhmanager:transfert"].reenable
        Rake::Task["dwhmanager:transfert"].execute
        redirect_to blazer_path
      end 

    def view_chart
      redirect_to blazer_path
    end 

end

