require "test_helper"

module Dinero
  module Errors
    class NotFoundTest < Minitest::Test
      def test_default_message
        error = NotFound.new
        assert_equal "No results were found for your request.", error.message
      end

      def test_response_attribute
        response = { code: 404 }
        error = NotFound.new(response: response)
        assert_equal response, error.response
      end
    end
  end
end
