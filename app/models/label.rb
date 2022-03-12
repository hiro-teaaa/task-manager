class Label < ApplicationRecord
  validates :task_name, presence: true,  length: { maximum: 10 }
end
