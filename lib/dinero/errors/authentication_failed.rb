module Dinero
  module Errors
    class AuthenticationFailed < Error
      def message = "You did not supply valid authentication credentials."
    end
  end
end
