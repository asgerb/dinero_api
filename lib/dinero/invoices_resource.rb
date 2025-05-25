module Dinero
  class InvoicesResource < Resource
    def list(**params)
      response = get("v1/#{client.organization_id}/invoices", params: params)
      Collection.from_response(response, key: "instances", type: Invoice)
    end

    def retrieve(id)
      response = get("v1/#{client.organization_id}/invoices/#{id}")
      Invoice.from_response(response)
    end

    def retrieve_pdf(id)
      response = get("v1/#{client.organization_id}/invoices/#{id}", headers: {"Accept" => "application/octet-stream"})
      response.body
    end

    def create(**params)
      response = post("v1/#{client.organization_id}/invoices", params: params)
      response.body
    end
  end
end
