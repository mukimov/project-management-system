class ProjectStepsController < ApplicationController
  include Wicked::Wizard
  steps :intake, :subject, :supervisor, :members

  def show
    @project = Project.find(params[:project_id])
    render_wizard
  end

  def update
    @project = Project.find(params[:project_id])
    case step
    when :members
      params[:project][:user_ids].each do |user_id|
        @project.members << Member.new(:user_id => user_id)
      end
    else
      @project.attributes = params[:project]
    end
    render_wizard @project
  end

  private

  def redirect_to_finish_wizard
    @project = Project.find(params[:project_id])
    redirect_to project_path(@project), :notice => "Project was successfully created!"
  end
end
