class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 190 }
  validates :detail, length: { maximum: 190 }
  validates :priority, presence: true, numericality: { only_integer: true }
  validates :status, presence: true, numericality: { only_integer: true }
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  # date型の検証ができない
  # private
  # def date_valid?
  #   !! Date.parse(:date_limit) rescue false
  # end
  # https://qiita.com/rotelstift/items/25b594e4f67b4a94c703

  def self.search(search_word)
    where("task_name LIKE ? OR detail LIKE ?", "%#{search_word}%", "%#{search_word}%")
  end
end
