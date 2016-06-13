require 'spec_helper'

shared_examples "Create Note" do
  describe "Create Note" do
    before(:all) do
      visit(IdeasPage)
      on(IdeasPage).go_to_idea @idea.title
      @created_at = DateTime.now
    end

    it "creates a Note" do
      on(NotesPage).add_note_with @note.content
      @current_page.wait_for(on(NotesPage).notes_list_element)
    end

    it "displays Note's content" do
      expect(on(NotesPage).find_by_content(@note.content)).not_to be_nil
    end

    it "displays Note's date" do
      # expect(on(NotesPage).created_at_date).to be_between(@created_at - 10.seconds, @created_at + 10.seconds)
      expect(on(NotesPage).created_at_date).to be_within(10.seconds).of(@created_at)
    end
  end
end

shared_examples "Update Note" do
  describe "Update Note" do
    before(:all) do
      visit(IdeasPage)
      on(IdeasPage).go_to_idea @idea.title
    end

    it "updates a Note" do
      on(NotesPage).edit_note(@note.content, @updated_note.content)
      @current_page.wait_for(on(NotesPage).notes_list_element)
    end

    it "displays updated Note's content" do
      expect(on(NotesPage).find_by_content(@updated_note.content)).not_to be_nil
    end
  end
end

shared_examples "Delete Note" do
  describe "Delete Note" do
    before(:all) do
      visit(IdeasPage)
      on(IdeasPage).go_to_idea @idea.title
    end

    it "deletes a Note" do
      on(NotesPage).delete_note(@updated_note.content)
      @current_page.wait_for(on(NotesPage).notes_info_element)
    end

    it "finds no notes" do
      expect(on(NotesPage).notes_list_element.exists?).to be_falsy
    end

    it "displays no notes info" do
      expect(on(NotesPage).notes_info_element.when_visible.text).to eq "Nothing has been said, yet!"
    end
  end
end
