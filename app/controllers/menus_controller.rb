class MenusController < ApplicationController
  def index
    render "menus/index"
  end

  def create
    new_menu = Menu.new(name: params[:name])
    new_menu.save
    redirect_to "/menus"
  end

  def show
    id = params[:id]
    menu = Menu.find(id)
    #render "todo"
    render plain: menu.display
  end
end
