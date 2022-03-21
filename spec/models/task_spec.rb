require 'rails_helper'

RSpec.describe Task, type: :model do

  context "Createテスト" do
    # 正常系
    it "is　valid with a task_name, date_limit, priority, status" do
      task = Task.new(
        task_name: "テストタスク",
        detail: "テストタスク詳細",
        date_limit: "2022-01-10",
        priority: 2,
        status: 0
      )
      expect(task).to be_valid
    end

    it "is valid with a create new task only with task_name" do
      task = Task.new(
        task_name: "テストタスク",
      )
      expect(task).to be_valid
    end
    #日付が正しく保存されていることを確認
    it 'should Task be created with correct date_limit with valid input' do
      date = "2021-01-10"
      task = Task.create(
        task_name: "テストタスク",
        date_limit: date
      )
      expect(task.date_limit.strftime("%Y-%m-%d").to_s).to eq date
    end

    # label追加
    # TODO: ラベル追加

    ## 境界値
    it "is valid with a length of task_name is 190" do
      task = Task.new(task_name: "a" * 190, detail: "a" * 190)
      expect(task).to be_valid
    end

    # 異常系
    it "is invalid without a task_name" do
      task = Task.new(task_name: nil)
      task.valid?
      expect(task.errors[:task_name]).to include("can't be blank")
    end
    it "is invalid with over 190 of task_name length" do
      task = Task.new(task_name: "a" * 191)
      task.valid?
      expect(task.errors[:task_name]).to include("is too long (maximum is 190 characters)")
    end
    it "is invalid with over 190 of detail length" do
      task = Task.new(detail: "a" * 191)
      task.valid?
      expect(task.errors[:detail]).to include("is too long (maximum is 190 characters)")
    end
    it "is invalid with type of priority isnt INT" do
      task = Task.new(task_name: "test_task", priority: "a")
      task.valid?
      expect(task.errors[:priority]).to include("is not a number")
    end
    it "is invalid with type of status isnt INT" do
      task = Task.new(task_name: "test_task", status: "a")
      task.valid?
      expect(task.errors[:status]).to include("is not a number")
    end
    it 'should date_limit be nil with invalid Type' do
      task = Task.create(task_name: "invalid_task1", date_limit: "invalid_date_limit")
      expect(task.date_limit).to eq nil
    end
  end
  describe "検索テスト" do
    context "タスク名検索テスト" do
      before do
        @user = User.create(
          user_name: "test_user1",
          email: "test@example.com",
          password: "password"
        )
        # task_names = %w[taskA taskB taskB]
        # task_names.each do |task_name|
        #   Task.create(
        #     task_name: task_name,
        #     users: [@user]
        #   )
        # end
        @task = Task.create(
          task_name: 'searchWord',
          users: [@user],
          detail: '詳細text'
        )
      end
      it "存在するタスク名で検索すると正しく結果を返す" do

        result = Task.search("search")[0]
        expect(result.task_name).to eq @task.task_name
      end
      # it "存在するタスク名で検索すると全ての結果を返す" do
      #
      #   result = Task.search("task")
      #   expect(result.length).to eq 3
      #   result.map { |task| expect(task.task_name).to include "task" }
      # end
      it "存在しないタスク名で検索すると何も返さない" do

        result = Task.search("NoResult")
        expect(result).to be_empty
      end
      it "存在するタスク詳細で検索すると正しく結果を返す" do
        print @task.detail
        result = Task.search("詳細")[0]
        expect(result.task_name).to eq @task.task_name
        expect(result.detail).to eq @task.detail
      end
    end
  end
  describe "タスク詳細検索テスト" do
    it "存在するタスク詳細で検索すると正しく結果を返す" do

      result = Task.search("detail")[0]
      expect(result.task_name).to eq @task.task_name
      expect(result.detail).to eq @task.detail
    end
    # it "存在するタスク詳細で検索すると正しく全ての結果を返す" do
    #
    #   result = Task.search("test")[0]
    #   expect(result.task_name).to eq @task.task_name
    #   result.map { |task| expect(task.task_name).to include "test" }
    # end
    it "存在しないタスク名で検索すると何も返さない" do

      result = Task.search("NoResult")
      expect(result).to be_empty
    end
  end
end
