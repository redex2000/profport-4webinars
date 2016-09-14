class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    competences_path
  end

  def after_sign_out_path_for(resource_or_scope)
    competences_path
  end

end
