require "test_helper"

module Dinero
  module Errors
    class ServerErrorTest < Minitest::Test
      def test_default_message
        error = ServerError.new
        assert_equal "We were unable to perform the request due to server-side problems.", error.message
      end

      def test_response_attribute
        response = { code: 500 }
        error = ServerError.new(response: response)
        assert_equal response, error.response
      end
    end
  end
end
