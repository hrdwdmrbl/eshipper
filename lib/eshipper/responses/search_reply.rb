# frozen_string_literal: true

module EShipper
  class SearchReply < EShipperResponse
    def self.search(options)
      request = EShipper::OrderSearchRequest.new(options)
      response = decode(request.send_now)
      if response["ErrorReply"]
        throw(ErrorReply.new(response))
      else
        new(response)
      end
    end
  end
end
