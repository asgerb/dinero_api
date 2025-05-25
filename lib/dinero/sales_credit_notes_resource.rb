module Dinero
  class SalesCreditNotesResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/sales/creditnotes", params: params)
      Collection.from_response(response, type: SalesCreditNote)
    end

    def retrieve(guid)
      response = get("v1/#{organization_id}/sales/creditnotes/#{guid}")
      SalesCreditNote.from_response(response)
    end
  end
end
