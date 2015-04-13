require 'test_helper'

class RunTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
	@run = @user.runs.build(note: "Marathon Run")
  end

  test "should be valid" do
    assert @run.valid?
  end

  test "user id should be present" do
    @run.user_id = nil
    assert_not @run.valid?
  end

  test "note should be present " do
    @run.note = "   "
    assert_not @run.valid?
  end

  test "note should be at most 250 characters" do
    @run.note = "a" * 251
    assert_not @run.valid?
  end

  test "order should be most recent first" do
    assert_equal Run.first, runs(:most_recent)
  end
end
