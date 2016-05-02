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
      render 'new'
    end
  end

  def update
    @idea = current_user.ideas.find(params[:id])

    if @idea.update(idea_params)
      flash[:success] = 'Idea updated!'
      redirect_to @idea
    else
      render 'edit'
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])

    if @idea.destroy
      flash[:success] = 'Idea deleted!'
    end
    redirect_to ideas_path
  end

  private
    def idea_params
      params.require(:idea).permit(:title)
    end
end
