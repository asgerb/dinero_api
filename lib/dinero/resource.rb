require "forwardable"

module Dinero
  class Resource
    extend Forwardable

    def_delegator :@client, :organization_id
    def_delegator :@client, :connection

    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get(url, params: {}, headers: {})
      handle_response connection.get(url, params, headers)
    end

    def post(url, params: {}, headers: {})
      response = handle_response connection.post(url, params, headers)
      response.body.deep_transform_keys!(&:underscore)
      response
    end

    def put(url, params: {}, headers: {})
      response = handle_response connection.put(url, params, headers)
      response.body.deep_transform_keys!(&:underscore)
      response
    end

    def delete(url, params: {}, headers: {})
      handle_response connection.delete(url, params, headers)
    end

    def handle_response(response)
      case response.status
      when 400 then raise Errors::BadRequest.new(response: response)
      when 401 then raise Errors::AuthenticationFailed.new(response: response)
      when 403 then raise Errors::PermissionDenied.new(response: response)
      when 404 then raise Errors::NotFound.new(response: response)
      when 429 then raise Errors::RateLimitExceeded.new(response: response)
      when 500 then raise Errors::ServerError.new(response: response)
      when 503 then raise Errors::ServiceUnavailable.new(response: response)
      end

      response
    end
  end
end
