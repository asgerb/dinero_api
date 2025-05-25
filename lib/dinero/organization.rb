# frozen_string_literal: true

module Dinero
  class Organization < Object
    def country
      ISO3166::Country.new(country_key)
    end

    def address
      [street, zip_code, city, country].compact.join(", ")
    end
  end
end
