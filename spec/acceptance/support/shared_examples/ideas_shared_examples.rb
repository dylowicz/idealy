require 'spec_helper'

shared_examples "Create Idea" do
  describe "Create Idea" do
    before(:all) do
      visit(IdeasPage)
    end

    it "goes to create form" do
      on(IdeasPage).add_new
      expect(on(IdeaNewPage).idea_form_header_element.when_visible.text).to eq "Create a new Idea"
    end

    it "fills new Idea form" do
      on(IdeaNewPage).submit_with(@idea.title, @idea.description)
      expect(on(IdeaPage).flash_message_element.when_visible.text).to eq "Idea created!"
    end

    it "redirects to created Idea page" do
      expect(on(IdeaPage).idea_box_element.visible?).to be_truthy
    end

    it "displays Idea's title" do
      expect(on(IdeaPage).title_element.when_visible.text).to eq @idea.title
    end

    it "displays Idea's description" do
      expect(on(IdeaPage).description_element.when_visible.text).to eq @idea.description
    end

    it "displays Idea's status" do
      expect(on(IdeaPage).status_element.when_visible.text).to eq "New"
    end

    it "finds no notes" do
      expect(on(NotesPage).notes_info_element.when_visible.text).to eq "Nothing has been said, yet!"
    end
  end
end

shared_examples "Update Idea" do
  describe "Update Idea" do
    before(:all) do
      visit(IdeasPage)
    end

    it "goes to created Idea page" do
      on(IdeasPage).go_to_idea(@idea.title)
      expect(on(IdeaPage).title_element.when_visible.text).to eq @idea.title
    end

    it "goes to edit form" do
      on(IdeaPage).go_to_edit
      expect(on(IdeaEditPage).idea_form_header_element.when_visible.text).to eq "Edit Idea"
    end

    it "finds form filled with current Idea title" do
      expect(on(IdeaEditPage).title_element.when_visible.value).to eq @idea.title
    end

    it "finds form filled with current Idea description" do
      expect(on(IdeaEditPage).description_element.when_visible.value).to eq @idea.description
    end

    it "finds form filled with current Idea status" do
      expect(on(IdeaEditPage).status_element.when_visible.value).to eq "new"
    end

    it "edits Idea with new data" do
      on(IdeaEditPage).submit_with(@updated_idea.title, @updated_idea.description, @updated_idea.status)
      expect(on(IdeaPage).flash_message_element.when_visible.text).to eq "Idea updated!"
    end

    it "redirects to created Idea page" do
      expect(on(IdeaPage).idea_box_element.visible?).to be_truthy
    end

    it "displays updated Idea's title" do
      expect(on(IdeaPage).title_element.when_visible.text).to eq @updated_idea.title
    end

    it "displays updated Idea's description" do
      expect(on(IdeaPage).description_element.when_visible.text).to eq @updated_idea.description
    end

    it "displays updated Idea's status" do
      expect(on(IdeaPage).status_element.when_visible.text).to eq @updated_idea.status.capitalize
    end
  end
end

shared_examples "Delete Idea" do
  describe "Delete Idea" do
    before(:all) do
      visit(IdeasPage)
    end

    it "goes to Idea page" do
      on(IdeasPage).go_to_idea(@updated_idea.title)
      expect(on(IdeaPage).title_element.when_visible.text).to eq @updated_idea.title
    end

    it "goes to edit form" do
      on(IdeaPage).go_to_edit
      expect(on(IdeaEditPage).idea_form_header_element.when_visible.text).to eq "Edit Idea"
    end

    it "deletes a Idea" do
      on(IdeaEditPage).delete_idea
      expect(on(IdeasPage).flash_message_element.when_visible.text).to eq "Idea deleted!"
    end

    it "redirects to Ideas page" do
      expect(on(IdeasPage).ideas_header_element.visible?).to be_truthy
    end
  end
end

shared_examples "Find Idea on Ideas list" do
  before(:all) do
    visit(IdeasPage)
  end
end
