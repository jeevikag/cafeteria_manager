class MenuitemsController < ApplicationController
  skip_before_action :ensure_menu

  def index
    #@menuitems = Menu.where(menu_id: current_menu.id)
    render "index"
  end

  def show
    id = params[:id]
    menuitem = Menuitem.of_menu(current_menu).find(id)
    render plain: menuitem
  end

  def new
    menu_id = params[:menu_id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menuitem = Menuitem.new(
      menu_id: current_menu.id,
      name: name,
      description: description,
      price: price,
    )
    if new_menuitem.save
      redirect_to cartitems_path
    end
  end

  def create
    menu_id = params[:menu_id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menuitem = Menuitem.new(
      menu_id: menu_id,
      name: name,
      description: description,
      price: price,
    )
    if new_menuitem.save
      redirect_to "/menuitems"
    else
      flash[:error] = new_menuitem.errors.full_messages.join(", ")
      redirect_to menuitems_path
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
    menuitem = Menuitem.of_menu(current_menu).find(id)
    menuitem.destroy
    redirect_to menuitems_path
  end
end
