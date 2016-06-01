class IdeasController < ApplicationController
  def index
    @ideas = current_user.ideas
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def new
    @idea = current_user.ideas.build
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def create
    @idea = current_user.ideas.build(idea_params)

    if @idea.save
      flash[:success] = 'Idea created!'
      redirect_to @idea
    else
      flash.now[:error] = 'Idea could not be created.'
      render 'new'
    end
  end

  def update
    @idea = current_user.ideas.find(params[:id])

    if @idea.update(idea_params)
      flash[:success] = 'Idea updated!'
      redirect_to @idea
    else
      flash.now[:error] = 'Idea could not be updated.'
      render 'edit'
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])

    if @idea.destroy
      flash[:success] = 'Idea deleted!'
      redirect_to ideas_path
    else
      flash[:error] = 'Idea could not be deleted.'
      redirect_to @idea
    end
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :description, :status)
    end
end
