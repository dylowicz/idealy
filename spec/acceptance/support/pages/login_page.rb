class LoginPage < BasePage
  page_url 'http://localhost:3000/login'

  h1(:login_header, text: "Log in")
  text_field(:email_field, id: 'email-textfield')
  text_field(:password_field, id: 'password-textfield')
  button(:login, id: 'login-button')
  link(:signup, id: 'sign-up-link')

  def go_to_signup
    signup
  end

  def login_with(email, password)
    self.email_field = email
    self.password_field = password
    login
  end
end
