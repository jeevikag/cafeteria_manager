class MenuitemsController < ApplicationController
  def index
    #menuitems = current_user.menuitems
    render "index"
  end

  def show
    id = params[:id]
    menuitem = Menuitem.of_user(current_user).find(id)
    render plain: menuitem
  end

  def create
    name = params[:name]
    description = params[:description]
    price = params[:price]
    menu_id = params[:menu_id]
    new_menuitem = Menuitem.new(
      name: name,
      description: description,
      price: price,
      menu_id: menu_id,
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
    menuitem = Menuitem.of_user(current_user).find(id)
    menuitem.name = name
    menuitem.save
    redirect_to menuitems_path
  end

  def destroy
    id = params[:id]
    menuitem = Menuitem.of_user(current_user).find(id)
    menuitem.destroy
    redirect_to todos_path
  end
end
