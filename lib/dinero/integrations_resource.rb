module Dinero
  class IntegrationsResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/integrations", params: params)
      Collection.from_response(response, type: Integration)
    end

    def mobilepay_invoice
      MobilepayInvoiceResource.new(client)
    end

    def pensopay
      PensopayResource.new(client)
    end
  end

  class MobilepayInvoiceResource < Resource
    def start(**params)
      response = post("v1/#{organization_id}/integrations/mobilepay-invoice/start", params: params)
      response.body
    end

    def accounting_access(**params)
      response = post("v1/#{organization_id}/integrations/mobilepay-invoice/accounting-access", params: params)
      response.body
    end

    def activate
      response = post("v1/#{organization_id}/integrations/mobilepay-invoice/activate")
      response.body
    end

    def deactivate
      response = post("v1/#{organization_id}/integrations/mobilepay-invoice/deactivate")
      response.body
    end
  end

  class PensopayResource < Resource
    def start(**params)
      response = post("v1/#{organization_id}/integrations/pensopay/start", params: params)
      response.body
    end

    def reactivate
      response = post("v1/#{organization_id}/integrations/pensopay/reactivate")
      response.body
    end

    def deactivate
      response = post("v1/#{organization_id}/integrations/pensopay/deactivate")
      response.body
    end
  end
end
