class Api::V1::UsersController < ApplicationController
	# protect_from_forgery

  def index
    @users = User.all
    render json: @users
  end

  def update
	  user = User.find(params[:id])
	  user.update(user_params)
	  render json: user
	end

	def destroy
		User.destroy(params[:id])
		render json: {
      status: 200,
      message: 'Destruído com sucesso'
    }, status: :ok
	end

	private
	def user_params
    params.require(:user).permit(:email, :title)
  end
end
