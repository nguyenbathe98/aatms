class Notification < ApplicationRecord
  has_many :notification_statuses, dependent: :destroy
  belongs_to :course 
end
