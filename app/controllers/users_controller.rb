class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "/users/new"
  end

  def create
    new_user = User.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      address: params[:address],
      password: params[:password],
      role: params[:role],
    )

    if new_user.save
      redirect_to new_sessions_path
      flash[:notice] = "Please Sign-in to continue."
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def destroy
    id = params[:id]
    user = User.all.find(id)
    user.destroy
    redirect_to users_path
  end
end
