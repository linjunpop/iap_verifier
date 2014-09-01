require "iap_verifier/version"
require 'iap_verifier/error'
require 'iap_verifier/request'
require 'iap_verifier/request_data'
require 'iap_verifier/response_data'
require 'iap_verifier/receipt'

module IAPVerifier
  class << self
    def verify_receipt!(receipt:, is_base64: false)
      IAPVerifier::Request.new(receipt: receipt, is_base64: is_base64).response.receipt
    end

    def verify_receipt(receipt:, is_base64: false)
      begin
        verify_receipt!(receipt: receipt, is_base64: is_base64)
      rescue IAPVerifier::Error::Standard
        return nil
      end
    end
  end
end
