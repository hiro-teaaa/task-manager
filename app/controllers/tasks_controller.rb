class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new()
    @lablels=Label.all
  end
  def create
    @task = Task.new(task_params)
    if @task.save
      if params[:task][:label_ids]
        begin
          @task.labels = params[:task][:label_ids].map { |id| Label.find(id.to_i) }
        rescue
          @task.destroy
          redirect_to action: :new
          flash[:alert] =  'タスクの登録に失敗しました'
        end
      end
      redirect_to action: :new
      flash[:notice] =  'タスクの登録に成功しました'
    else
      redirect_to action: :new
      flash[:alert] =  'タスクの登録に失敗しました'
    end
  end

  def edit
    @task = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end
  def update
    if @task.update(task_params)
        if params[:task][:label_ids]
          @task.labels = params[:task][:label_ids].map { |id| Label.find(id.to_i) }
        end
      redirect_to request.referer
      flash[:notice] =  'タスクの編集に成功しました'
    else
      redirect_to request.referer
      flash[:alert] =  'タスクの編集に失敗しました'
    end
  end
  def index
    @tasks = Task.all
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def destroy
    @task.destroy
    redirect_to request.referer
    flash[:alert] =  'タスクを削除しました'
    # TODO: 削除失敗時の処理を書く
  end


  private
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:task_name, :date_limit, :priority, :status, :label_ids)
  end

end
