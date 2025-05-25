module Dinero
  class ProductsResource < Resource
    def list(**params)
      response = get("v1/#{organization_id}/products", params: params)
      Collection.from_response(response, type: Product)
    end

    def retrieve(guid)
      response = get("v1/#{organization_id}/products/#{guid}")
      Product.from_response(response)
    end

    def create(**params)
      response = post("v1/#{organization_id}/products", params: params)
      response.body
    end
  end
end
