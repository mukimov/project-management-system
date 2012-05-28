class ActivitiesController < ApplicationController
  def index
    @project = Project.find(params[:id])
    @issues = @project.issues.sort_by{|value| -value.created_at.to_i}
    @news = @project.news.sort_by{|value| -value.created_at.to_i}
  end
end
