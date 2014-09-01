module IAPVerifier
  class Receipt
    def initialize(response_data)
      @receipt_data = response_data['receipt']
    end

    def to_h
      @receipt_data
    end

    def method_missing(method, *args)
      if @receipt_data.key?(method.to_s)
        @receipt_data.fetch(method.to_s)
      else
        super
      end
    end
  end
end
