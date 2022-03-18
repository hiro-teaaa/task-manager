class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 255 }
  validates :priority, presence: true,  numericality: { only_integer: true}
  validates :status, presence: true,  numericality: { only_integer: true}
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels


  # date型の検証ができない
  # private
  # def date_valid?
  #   !! Date.parse(:date_limit) rescue false
  # end
  # https://qiita.com/rotelstift/items/25b594e4f67b4a94c703

end
