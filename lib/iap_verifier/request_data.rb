module IAPVerifier
  class RequestData
    def initialize(receipt)
      @receipt = receipt
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
