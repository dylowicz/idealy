class TasksController < ApplicationController
  def edit
    @task = idea.tasks.find(params[:id])
  end

  def create
    @task = idea.tasks.create(task_params)

    redirect_to @idea
  end

  def update
    @task = idea.tasks.find(params[:id])
    @task.update(task_params)

    redirect_to @idea
  end

  def destroy
    @task = idea.tasks.find(params[:id])
    @task.destroy

    redirect_to @idea
  end

  private
    def idea
      @idea = Idea.find(params[:idea_id])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
