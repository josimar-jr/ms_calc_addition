require 'test_helper'

class SumControllerTest < ActionDispatch::IntegrationTest
  test "route accepts decimal numbers" do
    assert_recognizes({ controller: 'sum', action: ':sum', value1: '1.0', value2: '1.0' }, '/sum/1.0/1.0/')
  end

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
