class SignUpPage < BasePage
  page_url 'http://localhost:3000/signup'

  h1(:signup_header, text: "Sign up")
  text_field(:name_field, id: 'name-textfield')
  text_field(:email_field, id: 'email-textfield')
  text_field(:password_field, id: 'password-textfield')
  text_field(:password_confirmation_field, id: 'password-confirmation-textfield')
  button(:create_account, id: 'create-account-button')

  def signup(name, email, password)
    self.name_field = name
    self.email_field = email
    self.password_field = password
    self.password_confirmation_field = password
    create_account
  end
end
