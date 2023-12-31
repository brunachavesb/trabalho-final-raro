class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    response = HTTParty.get("https://git.raroacademy.com.br/api/v4/projects/#{@project.project_id}",
                            headers: { "PRIVATE-TOKEN" => ENV["GITLAB_TOKEN"] })

    if response.success?
      @project.update(
        name: response["name"],
        url: response["web_url"],
      )

      if @project.save
        redirect_to projects_path, notice: "Projeto criado com sucesso!"
      else
        render :new
      end
    else
      flash[:error] = "Houve um problema ao buscar os detalhes do projeto no GitLab"
      render :new
    end
  end

  def show
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: "Projeto atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Projeto excluído com sucesso!"
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_id)
  end
end
