class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_menu

  def new
    if @current_user
      redirect_to menus_path
    else
      render "home/new"
    end
  end
end
