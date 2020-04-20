class MenusController < ApplicationController
  def create
    new_menu = Menu.new(name: params[:name])
    new_menu.save
  end
end
