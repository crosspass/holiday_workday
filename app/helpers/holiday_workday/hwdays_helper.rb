module HolidayWorkday
  module HwdaysHelper
    def day_class(date)
      return '' unless date

      return 'bg-warn' if @workdays.include?(date) 
      return 'bg-primary' if @holidays.include?(date)
      return 'text-primary' if date.saturday? || date.sunday?
    end

    def toggle_date_class(holiday_workday)
      if holiday_workday.destroyed?
        holiday_workday.weekend? ? 'text-primary' : ''
      else
        holiday_workday.holiday? ? 'bg-primary' : 'bg-warn'
      end
    end
  end
end
