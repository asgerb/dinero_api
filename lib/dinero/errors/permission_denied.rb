module Dinero
  module Errors
    class PermissionDenied < Error
      def message = "You are not allowed to perform that action."
    end
  end
end
