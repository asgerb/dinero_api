module Dinero
  class PurchaseAccountsResource < Resource
    def list(**params)
      response = get("v1/#{client.organization_id}/accounts/purchase", params: params)
      Collection.from_response(response, key: "instances", type: PurchaseAccount)
    end

    def create(**params)
      post("v1/#{client.organization_id}/accounts/entry", params: params)
    end
  end
end
