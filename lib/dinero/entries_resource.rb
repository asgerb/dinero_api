module Dinero
  class EntriesResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/entries", params: params)
      Collection.from_response(response, type: Entry)
    end

    def changes(**params)
      response = get("v1/#{organization_id}/entries/changes", params: params)
      Collection.from_response(response, type: EntryChange)
    end
  end
end
