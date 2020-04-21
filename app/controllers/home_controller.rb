class HomeController < ApplicationController
  #before_action :ensure_user_logged_in

  def new
    render "home/new"
  end
end
