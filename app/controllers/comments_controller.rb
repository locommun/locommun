#!/bin/env ruby
# encoding: utf-8

class CommentsController < InheritedResources::Base

  before_filter :get_project

  def index
    @comment = @project.comments.build
    redirect_to project_path(@project)
  end

  def create
    create! do |success,failure|
      success.html { redirect_to project_path(@project) }
      failure.html { redirect_to project_path(@project), :alert => @project.errors.full_messages.first }
    end
  end

  def update
   update! do |success,failure|
      success.html { redirect_to project_path(@project) }
      failure.html { redirect_to project_path(@project), :alert => @library.errors.full_messages.first }
    end
  end

  def destroy
    authorize resource
    destroy! { project_path(@project)}
  end

  protected

  def begin_of_association_chain
    @project
  end


  def get_project
    @project = Project.find(params[:project_id])
  end


end
