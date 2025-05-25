module Dinero
  class ContactsResource < Resource
    def list(**params)
      response = get("v2/#{client.organization_id}/contacts", params: params)
      Collection.from_response(response, type: Contact)
    end

    def retrieve(guid)
      response = get("v1/#{client.organization_id}/contacts/#{guid}")
      Contact.from_response(response)
    end
  end
end
