require 'base64'

module IAPVerifier
  class RequestData
    def initialize(receipt, is_base64)
      @receipt = is_base64 ? receipt : Base64.urlsafe_encode64(receipt)
    end

    def to_h
      {
        'receipt-data' => @receipt
      }
    end

    def to_json
      to_h.to_json
    end
  end
end
