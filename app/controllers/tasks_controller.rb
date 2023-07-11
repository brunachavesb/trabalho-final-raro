class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Tarefa criada com sucesso."
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:project_id, :name, :description)
  end
end
