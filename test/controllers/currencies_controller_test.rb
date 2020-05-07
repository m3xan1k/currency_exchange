require 'test_helper'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  def setup
    (1..5).each do |i|
      Currency.create(name: "Currency #{i}", rate: rand(100).to_f)
    end
  end

  test "must return array of all currencies" do
    get currencies_path
    assert_response :success
  end
end
