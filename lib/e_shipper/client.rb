# frozen_string_literal: true

module EShipper
  class Client
    include Singleton

    attr_reader :username, :password, :url

    def initialize
      @options = if defined?(Rails.env)
        rails_config_path = Rails.root.join("config", "e_shipper.yml")
        YAML.load_file(rails_config_path)[Rails.env] if File.exist?(rails_config_path)
      else
        gem_config_path = File.expand_path("#{File.dirname(__FILE__)}/../../config/e_shipper.yml")
        YAML.load_file(gem_config_path) if File.exist?(gem_config_path)
      end
      @options.symbolize_keys!

      @username = @options[:username]
      @password = @options[:password]
      @url = @options[:url]

      raise "No username specified." if @username.nil? || @username.empty?
      raise "No password specified." if @password.nil? || @password.empty?
      raise "No url specified." if @url.nil? || @url.empty?
    end
  end
end
