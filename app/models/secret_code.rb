class SecretCode < ApplicationRecord
  belongs_to :user, optional: true

  validates :code, uniqueness: true, presence: true
  validate :unique_user

  paginates_per 10

  def unique_user
    errors.add(:code, :taken) if user_id_was.present?
  end
end
