class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :secret_code, dependent: :destroy

  enum role: %i[normal admin]
  attr_accessor :code

  validates :secret_code, presence: { message: 'must be available' }, unless: :admin?
  validates_presence_of :first_name

  accepts_nested_attributes_for :secret_code

  def code=(val)
    @code = val
    return if persisted?

    # Set Secret Code from code
    self.secret_code = SecretCode.find_by(code: code)
  end
end
