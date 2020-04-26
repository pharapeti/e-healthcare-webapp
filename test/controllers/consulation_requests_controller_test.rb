require 'test_helper'

class ConsulationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consulation_request = consulation_requests(:one)
  end

  test "should get index" do
    get consulation_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_consulation_request_url
    assert_response :success
  end

  test "should create consulation_request" do
    assert_difference('ConsulationRequest.count') do
      post consulation_requests_url, params: { consulation_request: { description: @consulation_request.description, directed_to_id: @consulation_request.directed_to_id, patient_id: @consulation_request.patient_id, scheduled_for: @consulation_request.scheduled_for } }
    end

    assert_redirected_to consulation_request_url(ConsulationRequest.last)
  end

  test "should show consulation_request" do
    get consulation_request_url(@consulation_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_consulation_request_url(@consulation_request)
    assert_response :success
  end

  test "should update consulation_request" do
    patch consulation_request_url(@consulation_request), params: { consulation_request: { description: @consulation_request.description, directed_to_id: @consulation_request.directed_to_id, patient_id: @consulation_request.patient_id, scheduled_for: @consulation_request.scheduled_for } }
    assert_redirected_to consulation_request_url(@consulation_request)
  end

  test "should destroy consulation_request" do
    assert_difference('ConsulationRequest.count', -1) do
      delete consulation_request_url(@consulation_request)
    end

    assert_redirected_to consulation_requests_url
  end
end
