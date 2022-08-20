# frozen_string_literal: true

module EShipper
  class OrderInformationReply < EShipperResponse
    def self.fetch(options)
      request = EShipper::OrderInformationRequest.new(options)
      response = decode(request.send_now)
      if response["ErrorReply"]
        throw(ErrorReply.new(response))
      else
        new(response)
      end
    end
  end
end
