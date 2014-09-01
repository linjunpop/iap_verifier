require 'test_helper'
require 'iap_verifier/receipt'

class ReceiptTest < MiniTest::Test
  def test_method_missing
    receipt = IAPVerifier::Receipt.new({ 'receipt' => { 'foo' => 'bar' } })

    assert_equal 'bar', receipt.foo
    assert_raises(NoMethodError) do
      receipt.bar
    end
  end
end
