helpers do
  def user_login(user)
    session[:id] = user.id
  end
end
