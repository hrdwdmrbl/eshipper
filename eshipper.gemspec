# -*- encoding: utf-8 -*-
# frozen_string_literal: true

require File.expand_path("../lib/eshipper/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "eshipper"
  gem.version       = EShipperRuby::VERSION
  gem.authors       = ["Marc 🐝", "Daniel Gonzalez", "Chris Wise", "Damien Imberdis"]
  gem.email         = ["hello@inventory.horse"]
  gem.description   = "eShipper API client"
  gem.summary       = "eShipper API wrapper for Ruby using ActiveResource"
  gem.homepage      = "https://github.com/hrdwdmrbl/eshipper"
  gem.licenses      = ["MIT"]

  gem.files         = %x(git ls-files).split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency("activeresource")
  gem.add_dependency("nokogiri")
end
