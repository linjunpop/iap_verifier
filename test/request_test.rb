require 'test_helper'
require 'iap_verifier/request'

class RequestTest < MiniTest::Test
  def test_empty_receipt
    assert_raises(IAPVerifier::Error::EmptyReceipt) do
      IAPVerifier::Request.new(nil)
    end

    assert_raises(IAPVerifier::Error::EmptyReceipt) do
      IAPVerifier::Request.new('')
    end
  end

  def test_response
    VCR.use_cassette('valid_receipt') do
      receipt = File.read(File.expand_path("../fixtures/base64_receipt", __FILE__))

      response_data = IAPVerifier::Request.new(receipt).response

      assert_equal true, response_data.valid?
    end
  end
end
