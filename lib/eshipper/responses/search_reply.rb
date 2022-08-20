# frozen_string_literal: true

module EShipper
  class SearchReply < EShipperResponse
    def self.search(options)
      request = EShipper::OrderSearchRequest.new(options)
      new(decode(request.send_now))
    end
  end
end
