module Dinero
  class DepositAccountsResource < Resource
    def list(**params)
      response = get("v1/#{client.organization_id}/accounts/deposit", params: params)
      Collection.from_response(response, key: "instances", type: DepositAccount)
    end
  end
end
