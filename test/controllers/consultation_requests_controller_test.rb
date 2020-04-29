require 'test_helper'

class ConsultationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consultation_request = consultation_requests(:one)
  end

  test "should get index" do
    get consultation_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_consultation_request_url
    assert_response :success
  end

  test "should create consultation_request" do
    assert_difference('ConsultationRequest.count') do
      post consultation_requests_url, params: { consultation_request: { description: @consultation_request.description, directed_to_id: @consultation_request.directed_to_id, patient_id: @consultation_request.patient_id, scheduled_for: @consultation_request.scheduled_for } }
    end

    assert_redirected_to consultation_request_url(ConsultationRequest.last)
  end

  test "should show consultation_request" do
    get consultation_request_url(@consultation_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_consultation_request_url(@consultation_request)
    assert_response :success
  end

  test "should update consultation_request" do
    patch consultation_request_url(@consultation_request), params: { consultation_request: { description: @consultation_request.description, directed_to_id: @consultation_request.directed_to_id, patient_id: @consultation_request.patient_id, scheduled_for: @consultation_request.scheduled_for } }
    assert_redirected_to consultation_request_url(@consultation_request)
  end

  test "should destroy consultation_request" do
    assert_difference('ConsultationRequest.count', -1) do
      delete consultation_request_url(@consultation_request)
    end

    assert_redirected_to consultation_requests_url
  end
end
