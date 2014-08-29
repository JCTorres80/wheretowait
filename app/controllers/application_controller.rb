class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :user_time_zone, :if => :current_user

  # methods
  def user_time_zone(&block)
    Time.use_zone(current_user.timezone, &block)
  end

  #def after_sign_in_path_for(resource)
  #  user_root_path
  #end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def render_optional_error_file(status_code)
    if status_code == :not_found
      render_404
    else
      super
    end
  end

  private

  def render_404
    respond_to do |type|
      type.html { render :template => 'errors/error_404', :layout => 'application', :status => 404 }
      type.all { render :nothing => true, :status => 404 }
    end
    true # so we can do "render_404 and return"
  end

end
