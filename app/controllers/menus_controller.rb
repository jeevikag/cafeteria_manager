class MenusController < ApplicationController
  def index
  end

  def create
    new_menu = Menu.new(name: params[:name])

    if new_menu.save
      redirect_to "/menus"
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to "/menus"
    end
  end

  def show
    id = params[:id]
    session[:current_menu_id] = id
    menu = Menu.find(id)
    render "menu-content", locals: { menu: menu }

    #render "menu_item", locals: { menu: menu }
    #@menu = Menu.find(params[:menu_id])
    #render :show, locals: { menu: @menu }
    #render plain: menu.display
  end

  def update
    menu = Menu.find(params[:menu_id])
    render :update, locals: { menu: menu }
  end

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    menu.destroy
    redirect_to "/menus"
  end
end
