class NotesController < ApplicationController
  def edit
    @note = idea.notes.find(params[:id])
  end

  def create
    @note = idea.notes.create(note_params)

    redirect_to @idea
  end

  def update
    @note = idea.notes.find(params[:id])
    @note.update(note_params)

    redirect_to @idea
  end

  def destroy
    @note = idea.notes.find(params[:id])
    @note.destroy

    redirect_to @idea
  end

  private
    def idea
      @idea = Idea.find(params[:idea_id])
    end

    def note_params
      params.require(:note).permit(:content)
    end
end
