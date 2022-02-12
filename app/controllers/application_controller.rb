class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale =
      params_locale ||
        cookies[:locale] ||
        http_accept_language.compatible_language_from(I18n.available_locales) ||
        I18n.default_locale
    cookies[:locale] = I18n.locale
  end

  def params_locale
    if locale = params[:locale]
      locale.to_sym.in?(I18n.available_locales) && locale
    end
  end
end
