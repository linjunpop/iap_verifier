module IAPVerifier
  module Error
    class Standard < StandardError; end

    class EmptyReceipt < Standard
      def message
        'Receipt cannot be empty.'
      end
    end

    class MalformedResponseData < Standard
      def initialize(data)
        @data = data
      end

      def message
        "Malformed response from Apple Server: #{data}"
      end
    end

    class InvalidReceiptData < Standard
      MESSAGES = {
        21000 => "App store could not read",
        21002 => "Data was malformed",
        21003 => "Receipt not authenticated",
        21004 => "Shared secret does not match",
        21005 => "Receipt server unavailable",
        21006 => "Receipt valid but sub expired",
        21007 => "Sandbox receipt sent to Production environment",
        21008 => "Production receipt sent to Sandbox environment"
      }

      def initialize(code)
        @code = code
      end

      def message
        {
          error_code: @code,
          message: MESSAGES.fetch(@code, 'Unknown error code')
        }
      end
    end
  end
end
