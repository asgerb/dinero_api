module Dinero
  module Errors
    class ServerError < Error
      def message = "We were unable to perform the request due to server-side problems."
    end
  end
end
