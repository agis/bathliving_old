class ProjectsController < ApplicationController
  def index
    @projects = Project.limit(16)
  end

  def show
    @project = Project.find(params[:id])
  end
end