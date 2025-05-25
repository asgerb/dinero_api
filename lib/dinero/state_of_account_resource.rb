module Dinero
  class StateOfAccountResource < Resource
    def retrieve(guid)
      response = get("v1/#{organization_id}/state-of-account/#{guid}")
      StateOfAccount.from_response(response)
    end

    def retrieve_pdf(guid)
      response = get("v1/#{organization_id}/state-of-account/#{guid}/pdf", headers: {"Accept" => "application/octet-stream"})
      response.body
    end

    def email(guid, **params)
      response = post("v1/#{organization_id}/state-of-account/#{guid}/email", params: params)
      response.body
    end
  end
end
