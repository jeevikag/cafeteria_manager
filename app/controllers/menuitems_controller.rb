class MenuitemsController < ApplicationController
  def index
    render plain: Menuitem.all.to_a
  end

  def show
    id = params[:id]
    menuitem = Menuitem.find(id)
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
    render plain: "New item has been created!!"
  end
end
