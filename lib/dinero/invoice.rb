module Dinero
  class Invoice < Object
    delegate :year, :month, to: :date

    def date
      Date.parse(super)
    end
  end
end
