class NotesController < ApplicationController
  def index
    @notes = idea.notes

    if request.xhr?
      render json: @notes
    else
      redirect_to @idea
    end
  end

  def edit
    @note = idea.notes.find(params[:id])
  end

  def create
    @note = idea.notes.create(note_params)

    if request.xhr?
      render json: @note
    else
      redirect_to @idea
    end
  end

  def update
    @note = idea.notes.find(params[:id])
    @note.update(note_params)

    if request.xhr?
      render json: @note
    else
      redirect_to @idea
    end
  end

  def destroy
    @note = idea.notes.find(params[:id])
    @note.destroy

    redirect_to @idea
  end

  private
    def idea
      @idea = current_user.ideas.find(params[:idea_id])
    end

    def note_params
      params.require(:note).permit(:content)
    end
end
