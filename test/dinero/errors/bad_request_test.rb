require "test_helper"

module Dinero
  module Errors
    class BadRequestTest < Minitest::Test
      def test_default_message
        error = BadRequest.new
        assert_equal "Your request was malformed.", error.message
      end

      def test_response_attribute
        response = { code: 400 }
        error = BadRequest.new(response: response)
        assert_equal response, error.response
      end
    end
  end
end
