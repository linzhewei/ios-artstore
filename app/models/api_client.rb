class ApiClient
  class << self
    def client
      @client ||= AFMotion::SessionClient.build("http://api-artstore.dev/") do
        response_serializer :json
      end
    end

    def update_authorization_header(header)
      client.headers["Authorization"] = header
    end
    
  end
end