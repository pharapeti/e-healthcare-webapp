require 'test_helper'

class UrgentRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urgent_request = urgent_requests(:one)
  end

  test "should get index" do
    get urgent_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_urgent_request_url
    assert_response :success
  end

  test "should create urgent_request" do
    assert_difference('UrgentRequest.count') do
      post urgent_requests_url, params: { urgent_request: { description: @urgent_request.description, patient_id: @urgent_request.patient_id } }
    end

    assert_redirected_to urgent_request_url(UrgentRequest.last)
  end

  test "should show urgent_request" do
    get urgent_request_url(@urgent_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_urgent_request_url(@urgent_request)
    assert_response :success
  end

  test "should update urgent_request" do
    patch urgent_request_url(@urgent_request), params: { urgent_request: { description: @urgent_request.description, patient_id: @urgent_request.patient_id } }
    assert_redirected_to urgent_request_url(@urgent_request)
  end

  test "should destroy urgent_request" do
    assert_difference('UrgentRequest.count', -1) do
      delete urgent_request_url(@urgent_request)
    end

    assert_redirected_to urgent_requests_url
  end
end
