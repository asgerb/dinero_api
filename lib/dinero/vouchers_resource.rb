module Dinero
  class VouchersResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/vouchers", params: params)
      Collection.from_response(response, type: Voucher)
    end

    def retrieve(guid)
      response = get("v1/#{organization_id}/vouchers/#{guid}")
      Voucher.from_response(response)
    end

    def create(**params)
      response = post("v1/#{organization_id}/vouchers", params: params)
      response.body
    end

    def retrieve_pdf(guid)
      response = get("v1/#{organization_id}/vouchers/#{guid}", headers: {"Accept" => "application/octet-stream"})
      response.body
    end
  end
end
