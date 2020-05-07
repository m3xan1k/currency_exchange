require 'test_helper'
require 'database_cleaner/active_record'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  def setup
    (1..5).each do |i|
      Currency.create(name: "Currency #{i}", rate: rand(100).to_f)
    end
  end

  def teardown
    DatabaseCleaner.clean_with :truncation
  end

  test "must return array of all currencies" do
    get currencies_path
    assert_response :success

    body = ActiveSupport::JSON.decode(response.body)
    assert body["data"].size == 5
  end

  test "must return correct currency" do
    get currencies_path
    body = ActiveSupport::JSON.decode(response.body)
    currency = body["data"][0]

    get currency_path(currency["id"])
    assert_response :success

    body = ActiveSupport::JSON.decode(response.body)
    currency_detail = body["data"]

    assert currency["name"] == currency_detail["name"]
    assert currency["rate"] == currency_detail["rate"]
  end

  test "must return not found" do
    get currencies_path
    body = ActiveSupport::JSON.decode(response.body)
    currency = body["data"][0]

    get currency_path(currency["id"] + 10)
    assert_response :not_found
  end
end
