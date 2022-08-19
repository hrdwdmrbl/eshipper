# frozen_string_literal: true

class EShipperXMLFormatter
  include ActiveResource::Formats::XmlFormat

  def decode(xml)
    ActiveResource::Formats::XmlFormat.decode(xml)
  end
end

module EShipper
  class EShipperResponse < ::ActiveResource::Base
    self.site = EShipper::Client.instance.url
    self.format = :xml
  end
end
