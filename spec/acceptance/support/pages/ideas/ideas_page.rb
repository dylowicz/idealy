class IdeasPage < BasePage
  include PageObject

  page_url 'http://localhost:3000/ideas'

  h1(:ideas_header, id: 'ideas-header')
  paragraph(:ideas_info, id: 'no-ideas-info')
  div(:ideas_list, id: 'ideas-list')
  link(:add_new, id: 'new-idea')

  def ideas
    ideas_list_element.link_elements(class: 'idea-item')
  end

  def find_by_title(idea_title)
    ideas.find{ |e| e.div_element(class: 'idea-title', text: idea_title) }
  end

  def go_to_idea(idea_title)
    find_by_title(idea_title).click
  end
 end
