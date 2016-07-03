class NotesController < ApplicationController
  def index
    @notes = idea.notes

    render status: :ok, json: @notes
  end

  def create
    @note = idea.notes.create(note_params)

    render status: :created, json: @note
  end

  def update
    @note = idea.notes.find(params[:id])
    @note.update(note_params)

    render status: :ok, json: @note
  end

  def destroy
    @note = idea.notes.find(params[:id])
    @note.destroy

    render status: :no_content, json: {}
  end

  private
    def idea
      @idea = current_user.ideas.find(params[:idea_id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end
end
