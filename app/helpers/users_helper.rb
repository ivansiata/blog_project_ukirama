module UsersHelper
  def users_params
    params.require(:user).permit(:name, :email, :password)
  end
end
