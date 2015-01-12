require 'json'
require 'httpclient'

module IAPVerifier
  class Request
    PRODUCTION_URL = "https://buy.itunes.apple.com/verifyReceipt"
    SANDBOX_URL = "https://sandbox.itunes.apple.com/verifyReceipt"

    def initialize(receipt)
      if receipt.nil? || (/\A[[:space:]]*\z/ === receipt)
        raise Error::EmptyReceipt.new
      end

      @request_data = {
        'receipt-data' => receipt
      }
    end

    def response
      verify_with_retry(@request_data)
    end

    private

    def verify_with_retry(request_data)
      response_data = verify(request_data, PRODUCTION_URL)

      if response_data.sandbox?
        response_data = verify(request_data, SANDBOX_URL)
      end

      response_data
    end

    def verify(request_data, url)
      http = HTTPClient.new
      http.ssl_config.ssl_version = :TLSv1
      response = http.post(
        url,
        body: request_data.to_json,
        header: {'Content-Type' => "application/json", 'Accept' => 'application/json'}
      )

      ResponseData.new(response.content)
    end
  end
end
