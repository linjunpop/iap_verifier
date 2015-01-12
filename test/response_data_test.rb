require 'test_helper'
require 'iap_verifier/response_data'
require 'iap_verifier/receipt'
require 'iap_verifier/error'

class ResponseDataTest < MiniTest::Test
  def test_success_response_json
    success_response_json = { 'status' => 0, 'receipt' => { } }.to_json
    response_data = IAPVerifier::ResponseData.new(success_response_json)

    assert_equal true, response_data.valid?
  end

  def test_error_response_json
    error_response_json = { 'status' => 21002 }.to_json
    response_data = IAPVerifier::ResponseData.new(error_response_json)

    assert_equal false, response_data.valid?
  end

  def test_sandbox_response_json
    # sandbox receipt sent to production server
    sandbox_response_json = { 'status' => 21007 }.to_json
    response_data = IAPVerifier::ResponseData.new(sandbox_response_json)

    assert_equal false, response_data.valid?
    assert_equal true, response_data.sandbox?
  end

  def test_receipt
    response_data = IAPVerifier::ResponseData.new({ 'receipt' => { } }.to_json)
    response_data.stubs(:valid?).returns(true)

    assert_equal true, response_data.receipt.instance_of?(IAPVerifier::Receipt)
  end

  def test_malformed_response_data
    assert_raises(IAPVerifier::Error::MalformedResponseData) do
      IAPVerifier::ResponseData.new('')
    end
  end

  def text_invalid_receipt_data
    assert_raises(IAPVerifier::Error::InvalidReceiptData) do
      IAPVerifier::ResponseData.new({ 'receipt' => { } }.to_json)
      response_data.stubs(:valid?).returns(false)
      response_data.receipt
    end
  end
end
