class LabelController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    # CRUD
    def new
      @label = Label.new()
    end
    def create
      @label = Label.new(label_params)

      if @label.save
        redirect_to action: :index
        flash[:notice] =  'ラベルの登録に成功しました'
      else
        redirect_to action: :index
        flash[:alert] =  'ラベルの登録に失敗しました'
      end
    end

    def edit
    end
    def update
      if @label.update(label_params)
        redirect_to request.referer
        flash[:notice] =  'ラベルの編集に成功しました'
      else
        redirect_to request.referer
        flash[:alert] =  'ラベルの編集に失敗しました'
      end
    end

    def destroy
      @label.destroy
      redirect_to request.referer
      flash[:alert] =  'ラベルを削除しました'
    end
    # -----
    # index
    def index
      @label = Label.all
    end
    # -----


    private
    # before_action
    def set_task
      @label = Label.find(params[:id])
    end
    def task_params
      params.require(:Label).permit(:label_name)
    end


end
