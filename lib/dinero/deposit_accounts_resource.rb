module Dinero
  class DepositAccountsResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/accounts/deposit", params: params)
      Collection.from_response(response, type: DepositAccount)
    end

    def create(**params)
      post("v1/#{organization_id}/accounts/deposit", params: params)
    end
  end
end
