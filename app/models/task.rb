class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 255 }
  validates :priority, presence: true,  numericality: { only_integer: true}
  validates :status, presence: true,  numericality: { only_integer: true}
end
