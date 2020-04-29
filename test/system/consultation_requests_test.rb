require "application_system_test_case"

class ConsultationRequestsTest < ApplicationSystemTestCase
  setup do
    @consultation_request = consultation_requests(:one)
  end

  test "visiting the index" do
    visit consultation_requests_url
    assert_selector "h1", text: "Consultation Requests"
  end

  test "creating a Consultation request" do
    visit consultation_requests_url
    click_on "New Consultation Request"

    fill_in "Description", with: @consultation_request.description
    fill_in "Directed to", with: @consultation_request.directed_to_id
    fill_in "Patient", with: @consultation_request.patient_id
    fill_in "Scheduled for", with: @consultation_request.scheduled_for
    click_on "Create Consultation request"

    assert_text "Consultation request was successfully created"
    click_on "Back"
  end

  test "updating a Consultation request" do
    visit consultation_requests_url
    click_on "Edit", match: :first

    fill_in "Description", with: @consultation_request.description
    fill_in "Directed to", with: @consultation_request.directed_to_id
    fill_in "Patient", with: @consultation_request.patient_id
    fill_in "Scheduled for", with: @consultation_request.scheduled_for
    click_on "Update Consultation request"

    assert_text "Consultation request was successfully updated"
    click_on "Back"
  end

  test "destroying a Consultation request" do
    visit consultation_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consultation request was successfully destroyed"
  end
end
