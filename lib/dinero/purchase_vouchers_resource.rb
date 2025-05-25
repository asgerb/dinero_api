module Dinero
  class PurchaseVouchersResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/vouchers/purchase", params: params)
      Collection.from_response(response, type: PurchaseVoucher)
    end
  end
end
