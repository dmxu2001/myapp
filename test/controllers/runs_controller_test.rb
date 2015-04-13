require 'test_helper'

class RunsControllerTest < ActionController::TestCase

  def setup
    @run = runs(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Run.count' do
      post :create, run: { note: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Run.count' do
      delete :destroy, id: @run
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    run = runs(:ants)
    assert_no_difference 'Run.count' do
      delete :destroy, id: run
    end
    assert_redirected_to root_url
  end

end


