require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get event_bill" do
    get :event_bill
    assert_response :success
  end

  test "should get create_event_bill" do
    get :create_event_bill
    assert_response :success
  end

end
