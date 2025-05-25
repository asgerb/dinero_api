module Dinero
  module Errors
    class RateLimitExceeded < Error
      def message =  "Your request exceeded the API rate limit."
    end
  end
end
