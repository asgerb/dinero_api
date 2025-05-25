module Dinero
  class SalesCreditNotesResource < Resource
    def list(**params)
      response = get("v1/#{client.organization_id}/sales/creditnotes", params: params)
      Collection.from_response(response, key: "instances", type: SalesCreditNote)
    end

    def retrieve(id)
      response = get("v1/#{client.organization_id}/sales/creditnotes/#{id}")
      SalesCreditNote.from_response(response)
    end
  end
end
