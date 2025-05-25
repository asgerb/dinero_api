module Dinero
  class EntryAccountsResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/accounts/entry", params: params)
      Collection.from_response(response, type: EntryAccount)
    end

    def create(**params)
      post("v1/#{organization_id}/accounts/entry", params: params)
    end
  end
end
