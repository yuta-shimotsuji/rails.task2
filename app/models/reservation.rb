class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :number_of_people, :start_day, :last_day, presence: true
    validates :number_of_people, numericality: { greater_than_or_equal_to: 1 }

    validate :date_before_start
    validate :date_before_finish



  def date_before_start
    return if start_day.blank?
    errors.add(:start_day, "は今日以降のものを選択してください") if start_day < Date.today
  end

  def date_before_finish
    return if last_day.blank? || start_day.blank?
    errors.add(:last_day, "は開始日以降のものを選択してください") if last_day < start_day
  end


end 