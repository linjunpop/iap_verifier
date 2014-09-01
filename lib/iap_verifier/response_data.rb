module IAPVerifier
  class ResponseData
    SUCCESS_RESPONSE_CODE = 0
    SANDBOX_RECEIPT_CODE = 21007

    def initialize(response_data)
      @response_data = response_data
    end

    def valid?
      status_code == SUCCESS_RESPONSE_CODE
    end

    def sandbox?
      status_code == SANDBOX_RECEIPT_CODE
    end

    def receipt
      if valid?
        Receipt.new(@response_data)
      else
        raise Error::InvalidResponseData.new(status_code)
      end
    end

    private

    def status_code
      @response_data['status']
    end
  end
end
