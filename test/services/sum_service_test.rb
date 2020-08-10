require 'test_helper'

class SumServiceTest < ActiveSupport::TestCase

  test "1 + 14 = 15" do
    @sum_service = SumService.new
    result = @sum_service.sum 1, 14

    assert_equal 15, result
  end

end