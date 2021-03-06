class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User

  after_create :send_confirmation_email, if: -> { !Rails.env.test? && User.devise_modules.include?(:confirmable) }

  private
  def send_confirmation_email
    self.send_confirmation_instructions
  end
  
end
