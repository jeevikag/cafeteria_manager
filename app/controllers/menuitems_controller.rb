class MenuitemsController < ApplicationController
  def index
    #menuitems = current_user.menuitems
    render "index"
  end

  def show
    id = params[:id]
    menuitem = Menuitem.find(id)
    render plain: menuitem
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
      redirect_to menuitems_path
    else
      flash[:error] = new_menuitem.errors.full_messages.join(", ")
      redirect_to menuitems_path
    end
  end

  def update
    id = params[:id]
    name = params[:name]
    menuitem = Menuitem.find(id)
    menuitem.name = name
    menuitem.save
    redirect_to menuitems_path
  end

  def destroy
    id = params[:id]
    menuitem = Menuitem.find(id)
    menuitem.destroy
    redirect_to todos_path
  end
end
