# frozen_string_literal: true

module EShipper
  class OrderInformationRequest < EShipper::Request
    attr_reader :order_id

    def initialize(order_id:)
      @order_id = order_id
      super()
    end

    def order_properties
      {
        orderId: @order_id,
        detailed: "true",
      }
    end

    def request_body
      builder = build do |xml|
        xml.OrderInformationRequest do
          xml.Order(order_properties)
        end
      end
      builder.to_xml
    end
  end
end
