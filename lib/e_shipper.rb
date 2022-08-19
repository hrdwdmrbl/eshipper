require "net/http"
require "nokogiri"
require "singleton"
require "yaml"
require "activeresource"

require("#{File.dirname(__FILE__)}/e_shipper/requests/request")
require("#{File.dirname(__FILE__)}/e_shipper/client")
require("#{File.dirname(__FILE__)}/e_shipper/responses/e_shipper_response")

Dir.glob("#{File.dirname(__FILE__)}/e_shipper/requests/*").sort.each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/e_shipper/responses/*").sort.each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/e_shipper/classes/*").sort.each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/e_shipper/core_extensions/*").sort.each { |file| require(file) }
