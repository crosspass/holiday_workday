module HolidayWorkday
  class Hwday < ApplicationRecord
    validates :date, uniqueness: true, presence: true
    enum day_type: %i[holiday workday]
    before_create :set_day_type

    def self.workdays(range)
      workday.where(date: range).pluck(:date)
    end

    def self.holidays(range)
      holiday.where(date: range).pluck(:date)
    end

    def self.worked_days(range)
      (range.reject{|x| x.sunday? || x.saturday?} - holidays(range) + workdays(range)).uniq
    end

    def self.weeks(range)
      weeks = []
      week_start = range.first
      return weeks if week_start > range.last

      week_end = week_start.at_end_of_week
      loop do
        break if week_start > range.last

        week_end = range.last if week_end > range.last
        week = (week_start..week_end).to_a
        weeks << week
        break if week_end == range.last

        week_start = week_end.next_day
        week_end = week_start.end_of_week
      end
      weeks
    end

    def weekend?
      date.saturday? || date.sunday?
    end

    private

    def set_day_type
      self.day_type = weekend? ? :worday : :holiday
    end
  end
end
