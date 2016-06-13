class IdeaEditPage < IdeaFormPage
  page_url 'http://localhost:3000/ideas/edit'

  select_list(:status, id: 'idea-status-select')
  link(:delete, id: 'delete-idea')

  def submit_with(title=nil, description=nil, status=nil)
    self.title = title if title
    self.description = description if description
    self.status = status if status
    submit
  end

  def delete_idea
    delete
  end
end