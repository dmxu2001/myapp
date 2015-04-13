require 'test_helper'

class RunsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "run interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Run.count' do
      post runs_path, run: { note: "" }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    note = "This run really ties the room together"
    assert_difference 'Run.count', 1 do
      post runs_path, run: { note: note }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match note, response.body
    # Delete a post.
    assert_select 'a', text: 'delete'
    first_run = @user.runs.paginate(page: 1).first
    assert_difference 'Run.count', -1 do
      delete run_path(first_run)
    end
    # Visit a different user.
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
