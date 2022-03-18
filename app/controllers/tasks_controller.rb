class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # CRUD
  def new
    @task = Task.new()
    @lablels=Label.all
  end
  def create
    @task = Task.new(task_params)
    if params[:task][:label_ids]
      @task.labels = params[:task][:label_ids].map { |id| Label.find(id.to_i) }
    end
    if @task.save
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
    @task.labels = params[:task][:label_ids]? params[:task][:label_ids].map { |id| Label.find(id.to_i) } : []
    if @task.update(task_params)
      redirect_to request.referer
      flash[:notice] =  'タスクの編集に成功しました'
    else
      redirect_to request.referer
      flash[:alert] =  'タスクの編集に失敗しました'
    end
  end

  def destroy
    @task.destroy
    redirect_to request.referer
    flash[:alert] =  'タスクを削除しました'
    # TODO: 削除失敗時の処理を書く
  end
  # -----
  # index
  def index
    @tasks = Task.order("#{sort_column} #{sort_direction}")
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end
  # -----


  private
  # before_action
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:task_name, :date_limit, :priority, :status, :label_ids)
  end
  # ----
  # to sort functions
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
