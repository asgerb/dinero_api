module Dinero
  class PurchaseAccountsResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/accounts/purchase", params: params)
      Collection.from_response(response, type: PurchaseAccount)
    end
  end
end
