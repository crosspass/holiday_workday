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
    # POST /holiday_workday/toggle
    def toggle
      @holiday_workday = Hwday.find_by(date: params[:date])
      if @holiday_workday
        @holiday_workday.destroy
      else
        date = Date.parse(params[:date])
        @holiday_workday = Hwday.workday.create(date: date)
      end
    rescue StandardError => e
      @e = e
      render 'error.js.erb'
    end
  end
end
