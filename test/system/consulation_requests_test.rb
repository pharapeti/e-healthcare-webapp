require "application_system_test_case"

class ConsulationRequestsTest < ApplicationSystemTestCase
  setup do
    @consulation_request = consulation_requests(:one)
  end

  test "visiting the index" do
    visit consulation_requests_url
    assert_selector "h1", text: "Consulation Requests"
  end

  test "creating a Consulation request" do
    visit consulation_requests_url
    click_on "New Consulation Request"

    fill_in "Description", with: @consulation_request.description
    fill_in "Directed to", with: @consulation_request.directed_to_id
    fill_in "Patient", with: @consulation_request.patient_id
    fill_in "Scheduled for", with: @consulation_request.scheduled_for
    click_on "Create Consulation request"

    assert_text "Consulation request was successfully created"
    click_on "Back"
  end

  test "updating a Consulation request" do
    visit consulation_requests_url
    click_on "Edit", match: :first

    fill_in "Description", with: @consulation_request.description
    fill_in "Directed to", with: @consulation_request.directed_to_id
    fill_in "Patient", with: @consulation_request.patient_id
    fill_in "Scheduled for", with: @consulation_request.scheduled_for
    click_on "Update Consulation request"

    assert_text "Consulation request was successfully updated"
    click_on "Back"
  end

  test "destroying a Consulation request" do
    visit consulation_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consulation request was successfully destroyed"
  end
end
