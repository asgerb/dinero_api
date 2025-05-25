require "ostruct"

module Dinero
  class Object < OpenStruct
    class << self
      def from_response(response)
        attributes = response.body.deep_transform_keys(&:underscore)
        new(attributes)
      end
    end

    def initialize(attributes)
      super(to_ostruct(attributes))
    end

    def attributes
      self.class.object_methods.grep(/[^=]$/)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [key, to_ostruct(val)] }.to_h)
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else
        obj
      end
    end
  end
end
