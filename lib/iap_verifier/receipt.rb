module IAPVerifier
  class Receipt
    def initialize(receipt_hash)
      @receipt_hash = receipt_hash
      @receipt_hash.each do |key, value|
        if key == :in_app
          define_singleton_method key, -> { value.map { |in_app| InApp.new(in_app)} }
        else
          define_singleton_method key, -> { value }
        end
      end
    end

    def to_h
      @receipt_hash
    end

    class InApp
      def initialize(in_app_hash)
        in_app_hash.each do |key, value|
          define_singleton_method key, -> { value }
        end
      end
    end
  end
end
