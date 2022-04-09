class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :contact	#user can have many contacts - association

before_commit :emailtypes
validate :CustomgemCM
         
def emailtypes
    require 'EmailType'
    user = User.last
    result = EmailType.emailchk(email)
    if result == 'Free email'
    user.update(emailtype: "Free Email Account")
    elsif result == 'Business email'
    user.update(emailtype: "Business Email Account")
    else
    user.update(emailtype: "Unknown Email Account")
    end
  end


def CustomgemCM
  return unless email.present?
    mxdomain = CustomgemCM.mxers(email)
    if mxdomain == "InvalidEmailDomain"         
       errors.add(:email, 'Invalid email domain specified')
      end
      end
end
