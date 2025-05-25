# frozen_string_literal: true

module Dinero
  class OrganizationsResource < Resource
    def list(**params)
      response = get("v1.1/organizations", params: params)
      response.body.map do |organization|
        Organization.new(organization.transform_keys(&:underscore))
      end
    end
  end
end
