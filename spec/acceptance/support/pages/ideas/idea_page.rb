class IdeaPage < BasePage

  div(:idea_box, id: 'idea-box')
  paragraph(:title, id: 'idea-title')
  paragraph(:description, id: 'idea-description')
  span(:status, id: 'idea-status')
  link(:edit, id: 'idea-edit')

  def go_to_edit
    edit_element.hover
    edit
  end
end