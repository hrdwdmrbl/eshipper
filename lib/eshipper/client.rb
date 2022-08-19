# frozen_string_literal: true

module EShipper
  class Client
    include Singleton

    attr_reader :url
    attr_accessor :username, :password

    def initialize
      @url = "https://web.eshipper.com/rpc2"
    end
  end
end
