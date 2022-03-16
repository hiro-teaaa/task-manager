class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 255 }
  validates :priority, presence: true,  numericality: { only_integer: true}
  validates :status, presence: true,  numericality: { only_integer: true}
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels
end
