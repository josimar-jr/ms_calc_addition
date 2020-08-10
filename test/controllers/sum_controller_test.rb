require 'test_helper'

class SumControllerTest < ActionDispatch::IntegrationTest
  test "1 + 14 = 15" do
    get '/sum/1/14', xhr: true

    body = JSON.parse @response.body
    assert_equal 15, body['result']
  end

  test "1 + AAA = 15" do
    get '/sum/1/AAA', xhr: true

    body = JSON.parse @response.body
    assert_equal 1, body['result']
  end
end
