require_dependency 'holiday_workday/application_controller'

module HolidayWorkday
  class HwdaysController < ApplicationController
    def index
      @current_year = params[:year] ? Date.parse(params[:year]) : Date.current.at_beginning_of_year
      range = (@current_year..@current_year.at_end_of_year)
      @holidays = Hwday.holidays(range)
      @workdays = Hwday.workdays(range)
    end

    ##
    # POST /holidy
    def toggle
      @holiday_workday = Hwday.find_by(date: params[:date])
      if @holiday_workday
        if @holiday_workday.date.sunday? || @holiday_workday.date.saturday?
          @holiday_workday.workday? ? @holiday_workday.destroy : @holiday_workday.workday!
        else
          @holiday_workday.holiday? ? @holiday_workday.destroy : @holiday_workday.holiday!
        end
      else
        date = Date.parse(params[:date])
        @holiday_workday =
          if date.sunday? || date.saturday?
            Hwday.workday.create(date: date)
          else
            Hwday.holiday.create(date: date)
          end
      end
    rescue StandardError => e
      @e = e
      render 'error.js.erb'
    end
  end
end
