module Dinero
  class SalesCreditNote < Object
    delegate :year, :month, to: :date

    def date
      Date.parse(super)
    end
  end
end
