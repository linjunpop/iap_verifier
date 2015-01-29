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
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request = Net::HTTP::Post.new(uri.request_uri)

      request['Accept'] = "application/json"
      request['Content-Type'] = "application/json"

      request.body = request_data.to_json

      response = http.request(request)

      ResponseData.new(response.body)
    end
  end
end
