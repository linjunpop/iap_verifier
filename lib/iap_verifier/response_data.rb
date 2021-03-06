require 'json'

module IAPVerifier
  class ResponseData
    SUCCESS_RESPONSE_CODE = 0.freeze
    SANDBOX_RECEIPT_CODE = 21007.freeze

    def initialize(json)
      @response_data = JSON.parse(json, symbolize_names: true)

      raise Error::MalformedResponseData.new(json) unless @response_data.is_a?(Hash)
    rescue JSON::ParserError
      raise Error::MalformedResponseData.new(json)
    end

    def valid?
      status_code == SUCCESS_RESPONSE_CODE
    end

    def sandbox?
      status_code == SANDBOX_RECEIPT_CODE
    end

    def receipt
      if valid?
        Receipt.new(@response_data.fetch(:receipt))
      else
        raise Error::InvalidReceiptData.new(status_code)
      end
    end

    private

    def status_code
      @response_data.fetch(:status)
    end
  end
end
