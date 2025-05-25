module Dinero
  class FilesResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/files", params: params)
      Collection.from_response(response, type: File)
    end

    def retrieve(file_guid)
      response = get("v1/#{organization_id}/files/#{file_guid}")
      File.from_response(response)
    end
  end
end
