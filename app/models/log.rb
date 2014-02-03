class Log < ActiveRecord::Base
  belongs_to :user

  validates :task, :result, length: { maximum:120 }
  validates :task, presence: true, on: :create
  # validates :result, presence: true, on: :update
end
