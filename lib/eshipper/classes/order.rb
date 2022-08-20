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
      order_information_reply = OrderInformationReply.fetch(order_id: self.Id, referenceCode: references.first&.Code)
      if order_information_reply.respond_to?(:OrderInformationReply)
        order_information_reply = order_information_reply.OrderInformationReply
        if order_information_reply.Order.is_a?(Array)
          # Sometimes there is a partial referenceCode match. In that case the API will return multiple Orders
          # However, the way they format the Orders, the properties of all orders are siblings.
          # In other words, the properties of an Order are NOT nested within the Order.
          # So the way the parser works is that it gives us arrays for each property.
          # TBD: Are properties of each Order ordered consistently?
          # TBD: Does the API always return the better matching result first???
          # Assume that the first result is the one we want!
          this_index = order_information_reply.Order.each_with_index.find do |_, index|
            order_information_reply.Order[index].id == self.Id
          end[1]
          order_information_reply.attributes.keys.each do |attribute_key|
            order_information_reply.send("#{attribute_key}=", order_information_reply.attributes[attribute_key][this_index])
          end
          throw("id mismatch") if order_information_reply.Order.id != self.Id
        end
        order_information_reply
      else
        # TODO: error handling
        nil
      end
    end
  end
end
