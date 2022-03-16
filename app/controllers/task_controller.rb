class TaskController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destory]
  def show
  end
  def edit
  end
  def update

  end
  def destory

  end
  #private methods
  private
  def set_task
    @task = Task.find(params[:id])
  end
end
