class ApplicationController < ActionController::Base
  helper_method :current_order
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_order
    @current_order ||= Order.find_by(id: session[:order_id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :city, :street_address, :postal_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :city, :street_address, :postal_code])
  end
end

