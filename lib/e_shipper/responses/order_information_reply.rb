# frozen_string_literal: true

module EShipper
  class OrderInformationReply < EShipperResponse
    self.format = :xml

    def self.fetch(options)
      request = EShipper::OrderInformationRequest.new(options)
      new(format.decode(request.send_now))
    end
  end
end
