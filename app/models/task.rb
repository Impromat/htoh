class Task < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_attached_file :picture,
    styles: { medium: "1200x1200", thumb: "300x300#" }

  validates_presence_of :title, :description, :address, :user
end
