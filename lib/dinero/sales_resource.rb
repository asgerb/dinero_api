module Dinero
  class SalesResource < Resource
    def list(**params)
      response = get("v1/#{client.organization_id}/invoices", params: params)
      Collection.from_response(response, key: "instances", type: Sale)
    end

    def settings
      response = get("v1/#{client.organization_id}/sales/settings")
      SalesSettings.from_response(response)
    end
  end
end
