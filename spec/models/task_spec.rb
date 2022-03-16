require 'rails_helper'

RSpec.describe Task, type: :model do
  # 正常系
  it "is　valid with a task_name, date_limit, priority, status" do
    task = Task.new(
      task_name: "テストタスク",
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

  # label追加
  # TODO: ラベル追加


  ## 境界値
  it "is valid with a length of task_name is 255" do
    task = Task.new(task_name: "a" * 255)
    expect(task).to be_valid
  end

  # 異常系
  it "is invalid without a task_name" do
    task = Task.new(task_name: nil)
    task.valid?
    expect(task.errors[:task_name]).to include("can't be blank")
  end
  it "is invalid with over 255 of task_name length" do
    task = Task.new(task_name: "a" * 256)
    task.valid?
    expect(task.errors[:task_name]).to include("is too long (maximum is 255 characters)")
  end
  it "is invalid with type of priority isnt INT" do
    task = Task.new(task_name: "test_task", priority: "a" )
    task.valid?
    expect(task.errors[:priority]).to include("is not a number")
  end
  it "is invalid with type of status isnt INT" do
    task = Task.new(task_name: "test_task", status: "a" )
    task.valid?
    expect(task.errors[:status]).to include("is not a number")
  end
end
