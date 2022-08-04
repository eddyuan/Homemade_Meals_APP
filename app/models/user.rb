class User < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :received_reviews,
           class_name: "Review",
           through: :meals,
           source: :reviews

  before_validation :downcase_email
  validates :email,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
            }
  has_secure_password

  def cook_rating
    self.received_reviews.count > 0 ? self.received_reviews.average(:rating) : 0
  end

  private

  def downcase_email
    self.email = self.email.downcase
  end
end
