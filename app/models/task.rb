class Task < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_attached_file :picture,
    styles: { medium: "500x500", thumb: "150x150#" }

  validates_presence_of :title, :description, :address, :user, :picture

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
