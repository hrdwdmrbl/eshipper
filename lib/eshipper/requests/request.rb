module EShipper
  class Request
    def client
      EShipper::Client.instance
    end

    def build(&block)
      throw "Missing EShipper::Client.instance.username" unless client.username
      throw "Missing EShipper::Client.instance.password" unless client.password

      Nokogiri::XML::Builder.new do |xml|
        xml.EShipper(
          version: "3.1.0",
          xmlns: "http://www.eshipper.net/XMLSchema",
          username: client.username,
          password: client.password
        ) do
          yield(xml)
        end
      end
    end

    def send_now
      uri = URI(EShipper::Client.instance.url)
      http_request = Net::HTTP::Post.new(uri.path)
      http_request.body = request_body

      http_session = Net::HTTP.new(uri.host, uri.port)

      http_session.use_ssl = true
      http_session.ssl_version = :TLSv1

      http_session.read_timeout = 3000
      # http_session.set_debug_output($stdout)

      http_response = http_session.start do |http|
        http.request(http_request)
      end

      http_response.body
    end
  end
end
