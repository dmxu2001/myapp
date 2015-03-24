require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  def setup
    @base_title = "Profilemyrun"
  end

  test "should get index" do
    get :index
    assert_response :success
	assert_select "title", "#{@base_title} | Home"

  end

  test "should get help" do
    get :help
    assert_response :success
	assert_select "title", "#{@base_title} | Help"
  end

end
