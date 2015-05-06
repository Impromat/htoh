class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  after_create :send_proposition_made_email
  after_create :send_booking_create_email
  after_update :send_proposition_accepted

  private

  def send_booking_create_email
    UserMailer.booking_create(self.user).deliver
  end

  def send_proposition_made_email
    UserMailer.proposition_made(self.task.user).deliver
  end

  def send_proposition_accepted
     UserMailer.proposition_accepted(self.user).deliver
  end
end
