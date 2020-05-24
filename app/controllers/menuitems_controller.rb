class MenuitemsController < ApplicationController
  def index
  end

  def show
    id = params[:id]
    @menuitem = Menuitem.find(id)
  end

  def new
    render "cart"
  end

  def create
    ensure_owner_logged_in

    #menu = Menu.find(params[:id])
    menu_id = session[:current_menu_id]

    new_menuitem = Menuitem.new(name: params[:name],
                                description: params[:description],
                                price: params[:price],
                                menu_id: menu_id)
    if new_menuitem.save
      flash[:success] = "#{params[:name]} added to  menu!"
      redirect_to "menus/#{menu_id}"
    else
      flash[:error] = new_menuitem.errors.full_messages.join(", ")
    end
  end

  def update
    id = params[:id]
    name = params[:name]
    menuitem = Menuitem.of_menu(current_menu).find(id)
    menuitem.name = name
    menuitem.save
    redirect_to menuitems_path
  end

  def destroy
    id = params[:id]
    menuitem = Menuitem.find(id)
    menu_id = menuitem.menu_id
    menuitem.destroy
    redirect_to "menus/#{menu_id}"
  end
end
