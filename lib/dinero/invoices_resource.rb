module Dinero
  class InvoicesResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/invoices", params: params)
      Collection.from_response(response, type: Invoice)
    end

    def retrieve(guid)
      response = get("v1/#{organization_id}/invoices/#{guid}")
      Invoice.from_response(response)
    end

    def retrieve_pdf(guid)
      response = get("v1/#{organization_id}/invoices/#{guid}", headers: {"Accept" => "application/octet-stream"})
      response.body
    end

    def create(**params)
      response = post("v1/#{organization_id}/invoices", params: params)
      response.body
    end
  end
end
