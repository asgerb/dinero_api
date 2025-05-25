module Dinero
  module Errors
    class ServiceUnavailable < Error
      def message = "You have been rate limited for sending more than 20 requests per second."
    end
  end
end
