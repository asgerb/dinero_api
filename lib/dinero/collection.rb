# frozen_string_literal: true

module Dinero
  class Collection
    attr_reader :data, :pagination

    def self.from_response(response, type:, key: "collection")
      body = response.body.is_a?(Hash) ? response.body.deep_transform_keys(&:underscore) : response.body
      new(
        data: (response.body.is_a?(Hash) ? body[key] : body).map { |attrs| type.new(attrs.transform_keys(&:underscore)) },
        pagination: (response.body.is_a?(Hash) ? body["pagination"] : nil)
      )
    end

    def initialize(data:, pagination:)
      @data = data
      @pagination = pagination
    end
  end
end
