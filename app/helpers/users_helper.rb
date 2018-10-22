module UsersHelper
  def users_params
    params.require(:user).permit(:name)
  end
end
