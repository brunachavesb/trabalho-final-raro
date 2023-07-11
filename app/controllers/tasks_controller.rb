class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  private

  def task_params
    params.require(:task).permit(:project_id, :name, :description)
  end
end
