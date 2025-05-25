require "test_helper"

module Dinero
  module Errors
    class AuthenticationFailedTest < Minitest::Test
      def test_default_message
        error = AuthenticationFailed.new
        assert_equal "You did not supply valid authentication credentials.", error.message
      end

      def test_response_attribute
        response = { code: 401 }
        error = AuthenticationFailed.new(response: response)
        assert_equal response, error.response
      end
    end
  end
end
