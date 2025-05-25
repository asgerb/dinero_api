require "test_helper"

module Dinero
  module Errors
    class ServiceUnavailableTest < Minitest::Test
      def test_default_message
        error = ServiceUnavailable.new
        assert_equal "You have been rate limited for sending more than 20 requests per second.", error.message
      end

      def test_response_attribute
        response = { code: 503 }
        error = ServiceUnavailable.new(response: response)
        assert_equal response, error.response
      end
    end
  end
end
