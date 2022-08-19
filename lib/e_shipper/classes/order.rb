# frozen_string_literal: true

module EShipper
  class Order < EShipperResponse
    def self.search(options = {})
      orders = SearchReply.search(options).OrderSearchReply.Order
      orders.is_a?(Array) ? orders : [orders]
    end

    def fetch
      OrderInformationReply.fetch(order_id: self.Id).OrderInformationReply
    end
  end
end
