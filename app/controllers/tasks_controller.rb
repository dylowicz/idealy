class TasksController < ApplicationController
  def index
    @tasks = idea.tasks

    render status: :ok, json: @tasks
  end

  def create
    @task = idea.tasks.create(task_params)

    render status: :created, json: @task
  end

  def update
    @task = idea.tasks.find(params[:id])
    @task.update(task_params)

    render status: :ok, json: @task
  end

  def destroy
    @task = idea.tasks.find(params[:id])
    @task.destroy

    render status: :no_content, json: {}
  end

  private
    def idea
      @idea = current_user.ideas.find(params[:idea_id])
    end

    def task_params
      params.require(:task).permit(:title, :completed)
    end
end
