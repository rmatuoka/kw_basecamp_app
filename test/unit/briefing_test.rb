require 'test_helper'

class BriefingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Briefing.new.valid?
  end
end
