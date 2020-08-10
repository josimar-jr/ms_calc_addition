require 'test_helper'

class HealthcheckControllerTest < ActionDispatch::IntegrationTest
  test "/" do
    get '/', xhr: true

    result = JSON.parse @response.body
    
    assert_equal "ok", result['status']
  end

  test "/healthcheck" do
    get healthcheck_url, xhr: true

    result = JSON.parse @response.body

    assert_equal "ok", result['status']
  end
end
