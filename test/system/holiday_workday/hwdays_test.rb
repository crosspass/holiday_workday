require "application_system_test_case"

module HolidayWorkday
  class HwdaysTest < ApplicationSystemTestCase
    setup do
      @hwday = holiday_workday_hwdays(:one)
    end

    test "visiting the index" do
      visit hwdays_url
      assert_selector "h1", text: "Hwdays"
    end

    test "creating a Hwday" do
      visit hwdays_url
      click_on "New Hwday"

      fill_in "Date", with: @hwday.date
      fill_in "Day type", with: @hwday.day_type
      click_on "Create Hwday"

      assert_text "Hwday was successfully created"
      click_on "Back"
    end

    test "updating a Hwday" do
      visit hwdays_url
      click_on "Edit", match: :first

      fill_in "Date", with: @hwday.date
      fill_in "Day type", with: @hwday.day_type
      click_on "Update Hwday"

      assert_text "Hwday was successfully updated"
      click_on "Back"
    end

    test "destroying a Hwday" do
      visit hwdays_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Hwday was successfully destroyed"
    end
  end
end
