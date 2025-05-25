module Dinero
  class WebhooksResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/webhooks", params: params)
      Collection.from_response(response, type: Webhook)
    end

    def retrieve(id)
      response = get("v1/#{organization_id}/webhooks/#{id}")
      Webhook.from_response(response)
    end

    def create(**params)
      response = post("v1/#{organization_id}/webhooks", params: params)
      response.body
    end

    def unsubscribe(event_id)
      response = post("v1/#{organization_id}/webhooks/unsubscribe", params: { event_id: event_id })
      response.body
    end
  end
end
