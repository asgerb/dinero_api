require "test_helper"

module Dinero
  module Errors
    class PermissionDeniedTest < Minitest::Test
      def test_default_message
        error = PermissionDenied.new
        assert_equal "You are not allowed to perform that action.", error.message
      end

      def test_response_attribute
        response = { code: 403 }
        error = PermissionDenied.new(response: response)
        assert_equal response, error.response
      end
    end
  end
end
