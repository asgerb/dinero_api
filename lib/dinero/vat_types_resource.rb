module Dinero
  class VatTypesResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/vatTypes", params: params)
      Collection.from_response(response, type: VATType)
    end
  end
end
