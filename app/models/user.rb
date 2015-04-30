class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_attached_file :avatar,
    :styles => { :medium => "300x300>", :thumb => "100x100#" }


  def image(style)
    if avatar.exists?
      avatar.url(style)
 #   else
 #     picture
    end
  end
end
