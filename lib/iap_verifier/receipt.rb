module IAPVerifier
  class Receipt
    def initialize(response_data)
      @receipt_data = response_data['receipt']

      unless @receipt_data.is_a?(Hash)
        raise Error::MalformedReceiptData
      end

      @receipt_data.each do |key, value|
        define_singleton_method key.to_s, -> { value }
      end
    end

    def to_h
      @receipt_data
    end
  end
end
