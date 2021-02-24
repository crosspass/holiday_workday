module HolidayWorkday
  module HwdaysHelper
    def day_class(date)
      return '' unless date

      if date.sunday? || date.saturday?
        @workdays.include?(date) ? 'text-warn' : 'text-primary'
      else
        @holidays.include?(date) ? 'text-primary' : 'text-warn'
      end
    end

    def toggle_date_class(holiday_workday)
      date = holiday_workday.date
      if holiday_workday.destroyed?
        date.sunday? || date.saturday? ? 'text-primary' : 'text-warn'
      else
        date.sunday? || date.saturday? ? 'text-warn' : 'text-primay'
      end
    end
  end
end
