class NotesPage < BasePage

  div(:tasks_box, id: 'tasks-box')
  h1(:tasks_header, id: 'tasks-header')
  paragraph(:notes_info, id: 'no-notes-info')
  div(:notes_list, id: 'notes-list')
  textarea(:add_note_content_textarea, id: 'add-note-content-textarea')
  button(:add_note, id: 'add-note')
  div(:note_content, class: 'note-content')
  textarea(:edit_note_content_textarea, class: 'edit-note-content-textarea')
  element(:note_created_at, :small, class: 'note-created-at')
  link(:save_edited_note, class: 'save-edit-note')
  span(:delete, class: 'delete-note')

  def notes
    notes_list_element.div_elements(class: 'note-item')
  end

  def find_by_content(content)
    notes.find { |e| e.div_element(class: 'note-content', text: content) }
  end

  def add_note_with(content)
    wait_for(add_note_content_textarea_element)
    self.add_note_content_textarea = content
    add_note
  end

  def edit_note(content, newContent)
    wait_for(notes_list_element)
    find_by_content(content).double_click
    self.edit_note_content_textarea = newContent
    save_edited_note
  end

  def delete_note(content)
    wait_for(notes_list_element)
    find_by_content(content).hover
    delete_element.click
  end
end
