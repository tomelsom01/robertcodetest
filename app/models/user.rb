class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :first_name, presence: { message: "First Name can't be blank" }
  validates :last_name, presence: { message: "Last Name can't be blank" }

  validate :password_complexity

  private

  def password_complexity
    return if password.blank? || password =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$/

    errors.add :password, 'must include at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character'
  end
end
