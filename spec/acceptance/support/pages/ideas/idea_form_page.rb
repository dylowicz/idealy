class IdeaFormPage < BasePage

  h1(:idea_form_header, id: 'idea-form-header')
  text_field(:title, id: 'title-textfield')
  textarea(:description, id: 'description-textarea')
  button(:submit, id: 'submit')
  link(:cancel, id: 'cancel')

  def submit_with(title=nil, description=nil)
    self.title = title
    self.description = description
    submit
  end
end