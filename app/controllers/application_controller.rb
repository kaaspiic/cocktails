class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if current_user
      I18n.locale = current_user.locale.presence || :lv
    end
  end
end
