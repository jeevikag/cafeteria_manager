class MenusController < ApplicationController
  skip_before_action :ensure_menu

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
    menu = Menu.of_user(current_user).find(id)
    #render "todo"
    render plain: menu.display
  end

  def update
    id = params[:id]
    menu = Menu.of_user(current_user).find(id)
    menu.name = name
    menu.save
    redirect_to "/menus"
  end

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    menu.destroy
    redirect_to "/menus"
  end
end
