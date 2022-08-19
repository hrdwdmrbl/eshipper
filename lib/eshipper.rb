require "net/http"
require "nokogiri"
require "singleton"
require "yaml"
require "activeresource"

require("#{File.dirname(__FILE__)}/eshipper/requests/request")
require("#{File.dirname(__FILE__)}/eshipper/client")
require("#{File.dirname(__FILE__)}/eshipper/responses/eshipper_response")

Dir.glob("#{File.dirname(__FILE__)}/eshipper/requests/*").sort.each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/eshipper/responses/*").sort.each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/eshipper/classes/*").sort.each { |file| require(file) }
