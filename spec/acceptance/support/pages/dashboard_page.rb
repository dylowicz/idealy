class Dashboard
  include PageObject

  link(:home, id: 'navbar-home')
  span(:user_name, id: 'navbar-user-name')
  link(:user, id: 'navbar-user')
  link(:login, id: 'navbar-user-login')
  link(:logout, id: 'navbar-user-logout')

  def go_to_homepage
    home
  end

  def go_to_login
    login
  end

  def logout_user
    user
    logout
  end
end
