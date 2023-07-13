class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :start, :stop]

  def index
    @tasks = Task.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def show
    @task = Task.find(params[:id])
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
    if @task.update(task_params)
      @task.update(edited: true) if @task.finished_at_changed?
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Tarefa excluída com sucesso."
  end

  def start
    @task.update(started: true, started_at: Time.current)
    redirect_to @task
  end

  def stop
    elapsed_time = Time.current - @task.started_at
    @task.update(finished: true, finished_at: Time.current)
    redirect_to @task
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:project_id, :name, :description, :started, :finished, :edited, :started_at, :finished_at, :elapsed_time)
  end
end
