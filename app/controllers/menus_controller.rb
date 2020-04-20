class MenusController < ApplicationController
  def index
    render "index"
  end

  def create
    new_menu = Menu.new(name: params[:name])
    new_menu.save
  end
end
