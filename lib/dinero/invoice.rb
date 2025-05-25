module Dinero
  class Invoice < Object
    def date = Date.parse(super)
  end
end
