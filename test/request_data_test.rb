require 'test_helper'
require 'iap_verifier/request_data'

class RequestDataTest < MiniTest::Test
  def test_base64_receipt
    receipt = File.read(File.expand_path("../fixtures/base64_receipt", __FILE__)).chop

    expected = {
      'receipt-data' => receipt
    }
    assert_equal expected, IAPVerifier::RequestData.new(receipt).to_h
  end
end
