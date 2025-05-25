# frozen_string_literal: true

module Dinero
  class AccessToken
    attr_reader :token, :expires_in, :type

    def initialize(token:, expires_in:, type:)
      @token = token
      @expires_in = expires_in
      @type = type
    end

    def expires_at
      Time.now.to_i + expires_in
    end

    def to_s
      token
    end
  end
end
