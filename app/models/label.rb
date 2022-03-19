class Label < ApplicationRecord
  validates :label_name, presence: true, uniqueness: true, length: { maximum: 10 }
  has_many :task_labels, dependent: :destroy
  has_many :tasks, through: :task_labels
end
