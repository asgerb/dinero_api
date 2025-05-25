module Dinero
  class SmsResource < Resource
    def validate(**params)
      response = post("v1/#{organization_id}/sms/validate", params: params)
      response.body
    end

    def send_sms(voucher_guid, **params)
      response = post("v1/#{organization_id}/sms/#{voucher_guid}/send-sms", params: params)
      response.body
    end
  end
end
