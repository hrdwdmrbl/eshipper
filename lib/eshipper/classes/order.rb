# frozen_string_literal: true

module EShipper
  class Order < EShipperResponse
    def self.search(options = {})
      orders = SearchReply.search(options).OrderSearchReply

      if orders == "\n" # No results
        []
      elsif orders.Order.is_a?(Array) # Multiple results
        orders.Order
      else # Single result
        [orders.Order]
      end
    end

    def references
      if self.References.Reference == "\n"
        []
      elsif self.References.Reference.is_a?(Array)
        self.References.Reference
      else
        [self.References.Reference]
      end
    end

    def fetch
      OrderInformationReply.fetch(order_id: self.Id).OrderInformationReply
    end
  end
end
