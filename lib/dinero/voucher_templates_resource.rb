module Dinero
  class VoucherTemplatesResource < Resource
    def types(**params)
      response = get("v1/#{organization_id}/vouchertemplates/types", params: params)
      Collection.from_response(response, type: VoucherTemplateType)
    end
  end
end
