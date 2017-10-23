class UsersController < ApplicationController
  def index
    render plain: "I'm in the index action!"
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(params[:id])
    user.update_attributes(user_params)
    # (params[:id], email: params[:user][:email], name: params[:user][:name])
    render json: user
  end

  def destroy
    @user = User.find(params[:id])
    if @user.exist?
      @user.delete
      render json: @user
    else
      render json: user.errors.full_messages
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
