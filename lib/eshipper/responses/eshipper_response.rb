# frozen_string_literal: true

module EShipper
  class EShipperResponse < ::ActiveResource::Base
    self.site = EShipper::Client.instance.url
    self.format = :xml

    def self.decode(xml)
      # Remove raw & which are illegal
      # https://stackoverflow.com/questions/17237334/illegal-character-in-raw-string-rexml-parsing
      xml.gsub!(/&(?!(?:amp|lt|gt|quot|apos);)/, "&amp;")
      format.decode(xml)
    end
  end
end
