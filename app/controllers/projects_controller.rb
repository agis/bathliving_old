class ProjectsController < ApplicationController
  caches_action :index, :show

  def index
    @projects = Project.limit(12)
  end

  def show
    @project = Project.find(params[:id])
    @previous_project = neighboor(Project, :previous)
    @next_project = neighboor(Project, :next)
  end
end