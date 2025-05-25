module Dinero
  class ContactsResource < Resource
    def list(**params)
      response = get("v2/#{organization_id}/contacts", params: params)
      Collection.from_response(response, type: Contact)
    end

    def retrieve(guid)
      response = get("v1/#{organization_id}/contacts/#{guid}")
      Contact.from_response(response)
    end

    def create(**params)
      post("v1/#{organization_id}/contacts", params: params)
    end

    def update(guid, **params)
      put("v1/#{organization_id}/contacts/#{guid}", params: params)
    end

    def remove(guid)
      delete("v1/#{organization_id}/contacts/#{guid}")
    end

    def restore(guid)
      post("v1/#{organization_id}/contacts/#{guid}/restore")
    end

    def notes
      ContactNotesResource.new(client)
    end
  end
end
