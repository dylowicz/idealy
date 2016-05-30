class TasksController < ApplicationController
  def index
    @tasks = idea.tasks

    if request.xhr?
      render json: @tasks
    else
      redirect_to @idea
    end
  end

  def edit
    @task = idea.tasks.find(params[:id])
  end

  def create
    @task = idea.tasks.create(task_params)

    if request.xhr?
      render json: @task
    else
      redirect_to @idea
    end
  end

  def update
    @task = idea.tasks.find(params[:id])
    @task.update(task_params)

    if request.xhr?
      render json: @task
    else
      redirect_to @idea
    end
  end

  def destroy
    @task = idea.tasks.find(params[:id])
    @task.destroy

    redirect_to @idea
  end

  private
    def idea
      @idea = current_user.ideas.find(params[:idea_id])
    end

    def task_params
      params.require(:task).permit(:title, :completed)
    end
end
