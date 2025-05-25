module Dinero
  class Error < StandardError
    attr_reader :response

    def initialize(response: nil)
      @response = response
      super()
    end
  end
end
