module Dinero
  class ContactNotesResource < Resource
    def list(contact_guid, **params)
      response = get("v2/#{organization_id}/contacts/#{contact_guid}/notes", params: params)
      Collection.from_response(response, type: ContactNote)
    end

    def retrieve(contact_guid, note_guid)
      get("v1/#{organization_id}/contacts/#{contact_guid}/notes/#{note_guid}")
    end

    def create(contact_guid, **params)
      post("v1/#{organization_id}/contacts/#{contact_guid}/notes", params: params)
    end

    def update(contact_guid, note_guid, **params)
      put("v1/#{organization_id}/contacts/#{contact_guid}/notes/#{note_guid}", params: params)
    end

    def remove(contact_guid, note_guid)
      delete("v1/#{organization_id}/contacts/#{contact_guid}/notes/#{note_guid}")
    end
  end
end
