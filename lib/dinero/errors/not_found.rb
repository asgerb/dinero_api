module Dinero
  module Errors
    class NotFound < Error
      def message = "No results were found for your request."
    end
  end
end
