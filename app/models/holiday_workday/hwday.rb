module HolidayWorkday
  class Hwday < ApplicationRecord
    validates :date, uniqueness: true, presence: true
    enum day_type: %i[holiday workday]

    def self.workdays(range)
      workday.where(date: range).pluck(:date)
    end

    def self.holidays(range)
      holiday.where(date: range).pluck(:date)
    end

    def self.weeks(range)
      weeks = []
      week_start = range.first
      week_start = week_start.at_end_of_week.next_day if week_start.sunday? || week_start.saturday?
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
  end
end
