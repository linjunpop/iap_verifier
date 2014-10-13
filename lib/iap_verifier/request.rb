require 'json'
require 'curb'
require 'oj'

module IAPVerifier
  class Request
    PRODUCTION_URL = "https://buy.itunes.apple.com/verifyReceipt"
    SANDBOX_URL = "https://sandbox.itunes.apple.com/verifyReceipt"

    def initialize(receipt)
      if receipt.nil? || (/\A[[:space:]]*\z/ === receipt)
        raise Error::EmptyReceipt.new
      end

      @request_data = RequestData.new(receipt)
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
      http = Curl.post(url, request_data.to_json) do |client|
        client.headers['Content-Type'] = "application/json"
        client.headers['Accept'] = "application/json"
      end
      response = http.body_str

      ResponseData.new(Oj.load(response))
    end
  end
end
