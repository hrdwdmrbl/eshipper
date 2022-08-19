# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.expand_path("../lib/e_shipper/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "e_shipper"
  gem.version       = EShipperRuby::VERSION
  gem.authors       = ["Marc 🐝", "Daniel Gonzalez", "Chris Wise", "Damien Imberdis"]
  gem.email         = ["hello@inventory.horse"]
  gem.description   = "e-shipper API client"
  gem.summary       = "e-shipper API wrapper for Ruby using ActiveResource"
  gem.homepage      = "https://github.com/hrdwdmrbl/eshipper"
  gem.licenses      = ["MIT"]

  gem.files         = %x(git ls-files).split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency("activeresource")
  gem.add_dependency("nokogiri")
end
