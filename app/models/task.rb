class Task < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_attached_file :picture,
    styles: { medium: "500x500", thumb: "150x150#" }
  after_create :send_task_create_email

  validates_presence_of :title, :description, :address, :user, :picture, :city

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  geocoded_by :full_address
  after_validation :geocode, if: ->(task){ (task.city.present? and task.city_changed?) || (task.address.present? and task.address_changed?) }

  private

  def full_address
    if address
      "#{address}, #{city}"
    else
      city
    end
  end

  def send_task_create_email
    UserMailer.task_create(self.user).deliver
  end

end
