class Review < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  after_commit :create_notifications, on: :update

  private

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'post'
      notification.actor = self.meal.user
      notification.user = self.user
      notification.target = self
    end
    
  end

end
