class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_i18n_locale 
  I18n.available_locales = [:fr, :de, :es, :en]
  I18n.default_locale = :fr

  def set_i18n_locale    
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
