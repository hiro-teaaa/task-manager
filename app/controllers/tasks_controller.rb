class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destory]
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(params.require(:task).permit(:task_name, :date_limit, :priority, :status))
    @task.save
    if @task.save
      redirect_to action: :new
      flash[:notice] =  'タスクの登録に成功しました'
    else
      redirect_to action: :new
      flash[:alert] =  'タスクの登録に失敗しました'
    end
  end
  def index
    @tasks = TaskLabel.joins(:task).select('*')
  end

end
