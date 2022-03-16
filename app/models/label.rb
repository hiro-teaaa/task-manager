class Label < ApplicationRecord
  validates :task_name, presence: true,  length: { maximum: 10 }
  has_many :task_labels, dependent: :destroy
  has_many :tasks, through: :task_labels
end
