module Dinero
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    delegate :organization_id, to: :client

    def get(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    def post(url, params: {}, headers: {})
      response = handle_response client.connection.post(url, params, headers)
      response.body.deep_transform_keys!(&:underscore)
      response
    end

    def put(url, params: {}, headers: {})
      response = handle_response client.connection.put(url, params, headers)
      response.body.deep_transform_keys!(&:underscore)
      response
    end

    def delete(url, params: {}, headers: {})
      response = handle_response client.connection.delete(url, params, headers)
      response.body.deep_transform_keys!(&:underscore)
      response
    end

    def handle_response(response)
      case response.status
      when 400
        raise BadRequestError, "Your request was malformed. #{response.body["error"]}"
      when 401
        raise AuthenticationError, "You did not supply valid authentication credentials. #{response.body["error"]}"
      when 403
        raise ForbiddenError, "You are not allowed to perform that action. #{response.body["error"]}"
      when 404
        raise NotFoundError, "No results were found for your request. #{response.body["error"]}"
      when 429
        raise ApiRateLimitError, "Your request exceeded the API rate limit. #{response.body["error"]}"
      when 500
        raise ServerError, "We were unable to perform the request due to server-side problems. #{response.body["error"]}"
      when 503
        raise ServiceUnavailableError, "You have been rate limited for sending more than 20 requests per second. #{response.body["error"]}"
      end

      response
    end
  end
end
