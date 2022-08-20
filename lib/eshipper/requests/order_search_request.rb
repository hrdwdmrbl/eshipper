require "date"

module EShipper
  class OrderSearchRequest < EShipper::Request
    attr_reader :fromDate
    attr_reader :toDate
    attr_reader :carrierId
    attr_reader :statusId
    attr_reader :startOrderId
    attr_reader :endOrderId
    attr_reader :carrierTrackingNumber
    attr_reader :referenceValue

    def initialize(
      fromDate: Date.today - 90, # [Required]
      toDate: Date.today, # [Required]
      carrierId: nil, # [Optional]
      statusId: nil, # [Optional]
      startOrderId: nil, # [Optional]
      endOrderId: nil, # [Optional]
      carrierTrackingNumber: nil, # [Optional]
      referenceValue: nil # [Optional]
    )
      throw("Order date range should be within 3 month.") if fromDate + 90 > toDate

      @fromDate = fromDate
      @toDate = toDate
      @carrierId = carrierId
      @statusId = statusId
      @startOrderId = startOrderId
      @endOrderId = endOrderId
      @carrierTrackingNumber = carrierTrackingNumber
      @referenceValue = referenceValue
      super()
    end

    def order_properties
      {
        fromDate: fromDate,
        toDate: toDate,
        carrierId: carrierId,
        statusId: statusId,
        startOrderId: startOrderId,
        endOrderId: endOrderId,
        carrierTrackingNumber: carrierTrackingNumber,
        referenceValue: referenceValue,
      }.compact
    end

    def request_body
      builder = build do |xml|
        xml.OrderSearchRequest do
          xml.Order(order_properties)
        end
      end

      builder.to_xml
    end
  end
end
