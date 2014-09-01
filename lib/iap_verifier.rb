require "iap_verifier/version"
require 'iap_verifier/error'
require 'iap_verifier/request'
require 'iap_verifier/request_data'
require 'iap_verifier/response_data'
require 'iap_verifier/receipt'

module IAPVerifier
  class << self
    def verify_receipt!(receipt:)
      IAPVerifier::Request.new(receipt: receipt).response.receipt
    end

    def verify_receipt(receipt:)
      begin
        verify_receipt!(receipt: receipt)
      rescue IAPVerifier::Error::Standard
        return nil
      end
    end
  end
end
