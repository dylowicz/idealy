class HomePage < BasePage
  page_url 'http://localhost:3000/'

  link(:signup, id: 'sign-up-link')

  def go_to_signup
    signup
  end
end
