require "application_system_test_case"

class UrgentRequestsTest < ApplicationSystemTestCase
  setup do
    @urgent_request = urgent_requests(:one)
  end

  test "visiting the index" do
    visit urgent_requests_url
    assert_selector "h1", text: "Urgent Requests"
  end

  test "creating a Urgent request" do
    visit urgent_requests_url
    click_on "New Urgent Request"

    fill_in "Description", with: @urgent_request.description
    fill_in "Patient", with: @urgent_request.patient_id
    click_on "Create Urgent request"

    assert_text "Urgent request was successfully created"
    click_on "Back"
  end

  test "updating a Urgent request" do
    visit urgent_requests_url
    click_on "Edit", match: :first

    fill_in "Description", with: @urgent_request.description
    fill_in "Patient", with: @urgent_request.patient_id
    click_on "Update Urgent request"

    assert_text "Urgent request was successfully updated"
    click_on "Back"
  end

  test "destroying a Urgent request" do
    visit urgent_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Urgent request was successfully destroyed"
  end
end
