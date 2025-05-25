module Dinero
  class LedgerItemsResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/ledgeritems", params: params)
      Collection.from_response(response, type: LedgerItem)
    end

    def ledgers(**params)
      response = get("v1/#{organization_id}/ledgeritems/ledgers", params: params)
      Collection.from_response(response, type: Ledger)
    end

    def book(**params)
      response = post("v1/#{organization_id}/ledgeritems/book", params: params)
      response.body
    end

    def status(**params)
      response = get("v1/#{organization_id}/ledgeritems/status", params: params)
      response.body
    end

    def delete(**params)
      response = post("v1/#{organization_id}/ledgeritems/delete", params: params)
      response.body
    end
  end
end
