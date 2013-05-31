class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  before_filter :set_i18n_locale
 
  def set_i18n_locale
    unless params[:locale]
        params[:locale] = extract_locale_from_accept_language_header
    end
    available = get_available_locales
    if available.include? params[:locale]
        I18n.locale = params[:locale]
    end
  end

  def extract_locale_from_accept_language_header
    if request.env['HTTP_ACCEPT_LANGUAGE']
      return request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    else
      return 'de'
    end
  end

  def default_url_options
    { :locale => I18n.locale }
  end
  
  helper_method :get_available_locales
  
  def get_available_locales
    ['en', 'de']
  end
  
  def current_admin
    if current_user && current_user.admin?
      current_user
    else
      nil
    end
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end  
  
  before_filter :request_location
  
  def request_location
    if params[:user_location] && !params[:user_location][:name].blank?
      session[:target_location]  = Geocoder.coordinates(params[:user_location][:name])
      session[:target_city] = params[:user_location][:name]
    elsif request.location && (!session.has_key?(:target_location) || (params[:user_location] && params[:user_location][:name].blank?))
      session[:target_location] = [request.location.latitude,request.location.longitude]
      queryresult = Geocoder.search(session[:target_location])
      session[:target_city] = queryresult.first.city if queryresult && queryresult.first
    end    
  end
  
end
