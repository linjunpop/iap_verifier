require 'test_helper'
require 'iap_verifier/receipt'

class ReceiptTest < MiniTest::Test
  def test_method_missing
    receipt = IAPVerifier::Receipt.new({
      adam_id: 123123,
      app_item_id: 33478347,
      application_version: "1264",
      bundle_id: "com.example.MyApp",
      download_id: 8607126,
      in_app: [
        {
          is_trial_period: "false",
          original_purchase_date: "2014-11-20 05:31:15 Etc/GMT",
          original_purchase_date_ms: "1416461475000",
          original_purchase_date_pst: "2014-11-19 21:31:15 America/Los_Angeles",
          original_transaction_id: "148994",
          product_id: "com.example.MyApp.pro",
          purchase_date: "2014-11-25 18:06:39 Etc/GMT",
          purchase_date_ms: "1416938799000",
          purchase_date_pst: "2014-11-25 10:06:39 America/Los_Angeles",
          quantity: "1",
          transaction_id: "148994"
        }
      ],
      original_application_version: "1260",
      original_purchase_date: "2014-11-18 01:28:07 Etc/GMT",
      original_purchase_date_ms: "1416274087000",
      original_purchase_date_pst: "2014-11-17 17:28:07 America/Los_Angeles",
      receipt_type: "Production",
      request_date: "2015-01-30 09:59:02 Etc/GMT",
      request_date_ms: "1422611942517",
      request_date_pst: "2015-01-30 01:59:02 America/Los_Angeles",
      version_external_identifier: 671
    })

    assert_equal '1260', receipt.original_application_version
    assert_equal '1416938799000', receipt.in_app.first.purchase_date_ms
    assert_raises(NoMethodError) do
      receipt.bar
    end
  end
end
