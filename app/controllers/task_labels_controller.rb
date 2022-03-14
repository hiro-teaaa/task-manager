class TaskLabelsController < ApplicationController
  before_action :set_author_post, only: [:show, :edit, :update, :destroy]
  def new
    @task_label = TaskLabel.new
  end
  def create
  end

  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_author_post
    @task_label = TaskLabel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def author_post_params
    params.require(:author_post).permit(:post_id, :author_id)
  end
end
