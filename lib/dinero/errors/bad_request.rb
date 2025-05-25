module Dinero
  module Errors
    class BadRequest < Error
      def message = "Your request was malformed."
    end
  end
end
