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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Tarefa atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Tarefa excluída com sucesso."
  end

  private

  def task_params
    params.require(:task).permit(:project_id, :name, :description)
  end
end
