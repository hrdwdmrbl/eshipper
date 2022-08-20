# frozen_string_literal: true

module EShipper
  class OrderInformationReply < EShipperResponse
    def self.fetch(options)
      request = EShipper::OrderInformationRequest.new(options)
      new(decode(request.send_now))
    end
  end
end
