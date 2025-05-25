require "test_helper"

module Dinero
  module Errors
    class RateLimitExceededTest < Minitest::Test
      def test_default_message
        error = RateLimitExceeded.new
        assert_equal "Your request exceeded the API rate limit.", error.message
      end

      def test_response_attribute
        response = { code: 429 }
        error = RateLimitExceeded.new(response: response)
        assert_equal response, error.response
      end
    end
  end
end
