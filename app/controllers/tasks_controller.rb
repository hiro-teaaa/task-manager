class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
    @lablels=Label.all
  end
  def create
    @task = Task.new(params.require(:task).permit(:task_name, :date_limit, :priority, :status))
    #TODO: Unpermitted parameter: :label_ids. と出てしまう
    # ,{:label_ids: []} を追加するとundefined method `task_name' for #<Label id: 2... と出てしまいうまくいかない
    # 最適解がありそうなので堀井さんに伺う
    @label_ids=params[:task][:label_ids]
    @label_ids.shift
    if @task.save
      @label_ids.each do |label_id|
        label=Label.find(label_id.to_i)
        @task.labels << label
      end
      redirect_to action: :new
      flash[:notice] =  'タスクの登録に成功しました'
    else
      redirect_to action: :new
      flash[:alert] =  'タスクの登録に失敗しました'
    end
  end
  def index
    @tasks = Task.left_joins(:task_labels).select('*')
  end

end
