module Dinero
  class AccountingYearsResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/accountingyears", params: params)
      Collection.from_response(response, type: AccountingYear)
    end
  end
end
