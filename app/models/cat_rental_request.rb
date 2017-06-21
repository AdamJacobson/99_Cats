class CatRentalRequest < ApplicationRecord
  STATUS = ['PENDING','APPROVED','DENIED']

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS, message: "%{value} is not an accepted value" }
  validate :end_after_start?
  validate :does_not_overlap_approved_requests?

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy

  def end_after_start?
    if end_date < start_date
      errors[:base] << 'end date must follow start date'
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_requests?
    return if status == 'DENIED'
    unless overlapping_approved_requests.empty?
      errors[:base] << 'cat rented during that time'
    end
  end

  def pending?
    status == 'PENDING'
  end

  def approve!
    self.transaction do
      self.update(status: 'APPROVED')
      overlapping_pending_requests.each(&:deny!)
    end
  end

  def deny!
    self.update(status: 'DENIED')
  end

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where(<<-SQL, start_date: start_date, end_date: end_date)
         NOT( (start_date > :end_date) OR (end_date < :start_date) )
    SQL
  end

end
