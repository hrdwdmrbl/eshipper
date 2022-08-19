# frozen_string_literal: true

module EShipper
  class SearchReply < EShipperResponse
    self.format = :xml

    def self.search(options)
      request = EShipper::OrderSearchRequest.new(options)
      new(format.decode(request.send_now))
    end
  end
end
