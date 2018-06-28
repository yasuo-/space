class User < ApplicationRecord
  has_many :listings,     dependent: :destroy
  has_many :reservations, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # validates :name, presence: true, length: { maximum: 15 },
  #                 uniqueness: { case_sensitive: false },
  #                 format: { with: /\A[a-z0-9]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }

  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/assets/icons/icon_user_default.svg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.extra.raw_info.name # assuming the user model has a name
        # user.token = auth.credentials.token,
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
    end
  end
end
