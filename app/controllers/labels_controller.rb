class LabelsController < ApplicationController
    before_action :set_task, only: [ :edit, :update, :destroy]
    # CRUD
    def new
      @label = Label.new()
    end
    def show

    end
    def create
      @label = Label.new(label_params)

      if @label.save
        redirect_to request.referer
        flash[:notice] =  'ラベルの登録に成功しました'
      else
        redirect_to request.referer
        flash[:alert] =  'ラベルの登録に失敗しました'
      end
    end

    def edit
    end
    def update
      if @label.update(label_params)
        redirect_to "/labels"
        flash[:notice] =  'ラベルの編集に成功しました'
      else
        redirect_to "/labels"
        flash[:alert] =  'ラベルの編集に失敗しました'
      end
    end

    def destroy
      @label.destroy
      redirect_to "/labels"
      flash[:alert] =  'ラベルを削除しました'
    end
    # -----
    # index
    def index
      @labels = Label.all
      @new_label = Label.new
    end
    # -----


    private
    # before_action
    def set_task
      @label = Label.find(params[:id])
    end
    def label_params
      params.require(:label).permit(:label_name)
    end


end
