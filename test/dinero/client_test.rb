require "test_helper"

module Dinero
  class ClientTest < Minitest::Test
    def test_making_request
      client = Dinero::Client.new(
        organization_id: ENV["DINERO_ORGANIZATION_ID"],
        api_key: ENV["DINERO_API_KEY"],
        client_id: ENV["DINERO_CLIENT_ID"],
        client_secret: ENV["DINERO_CLIENT_SECRET"]
      )

      response = client.invoices.list
      assert_instance_of Dinero::Collection, response
      assert_instance_of Dinero::Invoice, response.data.first
    end
  end
end
