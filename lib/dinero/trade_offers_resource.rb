module Dinero
  class TradeOffersResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/tradeoffers", params: params)
      Collection.from_response(response, type: TradeOffer)
    end

    def retrieve(guid)
      response = get("v1/#{organization_id}/tradeoffers/#{guid}")
      TradeOffer.from_response(response)
    end

    def create(**params)
      response = post("v1/#{organization_id}/tradeoffers", params: params)
      response.body
    end
  end
end
