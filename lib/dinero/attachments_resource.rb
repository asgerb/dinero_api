module Dinero
  class AttachmentsResource < Resource
    def bind_default(guid, type)
      post("v1/#{organization_id}/attachments/bind/default/#{guid}/#{type}")
    end

    def document_attachments(guid)
      get("v1/#{organization_id}/attachments/#{guid}")
    end

    def bind_with_attachment(document_guid, file_guid, file_name)
      post("v1/#{organization_id}/attachments/#{document_guid}/#{file_guid}/#{file_name}")
    end

    def remove_from_document(document_guid, file_guid)
      delete("v1/#{organization_id}/attachments/#{document_guid}/#{file_guid}")
    end
  end
end
