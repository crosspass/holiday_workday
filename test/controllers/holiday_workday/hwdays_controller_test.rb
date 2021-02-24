require 'test_helper'

module HolidayWorkday
  class HwdaysControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @hwday = holiday_workday_hwdays(:one)
    end

    test "should get index" do
      get hwdays_url
      assert_response :success
    end

    test "should get new" do
      get new_hwday_url
      assert_response :success
    end

    test "should create hwday" do
      assert_difference('Hwday.count') do
        post hwdays_url, params: { hwday: { date: @hwday.date, day_type: @hwday.day_type } }
      end

      assert_redirected_to hwday_url(Hwday.last)
    end

    test "should show hwday" do
      get hwday_url(@hwday)
      assert_response :success
    end

    test "should get edit" do
      get edit_hwday_url(@hwday)
      assert_response :success
    end

    test "should update hwday" do
      patch hwday_url(@hwday), params: { hwday: { date: @hwday.date, day_type: @hwday.day_type } }
      assert_redirected_to hwday_url(@hwday)
    end

    test "should destroy hwday" do
      assert_difference('Hwday.count', -1) do
        delete hwday_url(@hwday)
      end

      assert_redirected_to hwdays_url
    end
  end
end
