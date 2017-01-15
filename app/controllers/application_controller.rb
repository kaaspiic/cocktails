class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :verify_user, only: [:new, :create, :edit, :update, :destroy]

  def set_locale
    if current_user
      I18n.locale = current_user.locale.presence || :lv
    end
  end

  def verify_user
    redirect_to(root_path, alert: I18n.t('no_write_permissions')) unless current_user
    return
  end
end
