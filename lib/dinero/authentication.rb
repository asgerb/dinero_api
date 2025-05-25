require "faraday"
require "base64"

module Dinero
  class Authentication
    class << self
      URL = "https://authz.dinero.dk/dineroapi/oauth/token"

      def access_token(client_id: nil, client_secret: nil, api_key: nil, scope: "read write")
        authenticate(client_id, client_secret, api_key, scope)
      end

      private

      def authenticate(client_id, client_secret, api_key, scope)
        encoded_client_and_secret = Base64.strict_encode64("#{client_id}:#{client_secret}")

        connection = Faraday.new(url: URL) do |faraday|
          faraday.request :url_encoded
          faraday.response :json, content_type: "application/json"
          faraday.adapter Faraday.default_adapter
        end

        response = connection.post do |req|
          req.headers["Authorization"] = "Basic #{encoded_client_and_secret}"
          req.headers["Content-Type"] = "application/x-www-form-urlencoded"
          req.body = {
            grant_type: "password",
            scope: scope,
            username: api_key,
            password: api_key
          }
        end

        if response.success?
          AccessToken.new(
            token: response.body["access_token"],
            expires_in: response.body["expires_in"],
            type: response.body["token_type"]
          )
        else
          raise Errors::AuthenticationFailed.new(response: response)
        end
      end
    end
  end
end
