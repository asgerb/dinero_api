module Dinero
  class Client
    BASE_URL = "https://api.dinero.dk"

    attr_reader :organization_id

    def initialize(organization_id: ENV.fetch("DINERO_ORGANIZATION_ID"), api_key: ENV.fetch("DINERO_API_KEY"), client_id: ENV.fetch("DINERO_CLIENT_ID"), client_secret: ENV.fetch("DINERO_CLIENT_SECRET"), adapter: Faraday.default_adapter)
      @access_token = Dinero::Authentication.access_token(api_key: api_key, client_id: client_id, client_secret: client_secret)
      @adapter = adapter
      @organization_id = organization_id
    end

    def contacts
      Dinero::ContactsResource.new(self)
    end

    def invoices
      Dinero::InvoicesResource.new(self)
    end

    def sales
      Dinero::SalesResource.new(self)
    end

    def organizations
      Dinero::OrganizationsResource.new(self)
    end

    def entry_accounts
      Dinero::EntryAccountsResource.new(self)
    end

    def purchase_accounts
      Dinero::PurchaseAccountsResource.new(self)
    end

    def deposit_accounts
      Dinero::DepositAccountsResource.new(self)
    end

    def sales_credit_notes
      Dinero::SalesCreditNotesResource.new(self)
    end

    # https://api.dinero.dk/v1/${orgid}/accounts/deposit?fields=bankAccountNumber,bankRegistrationNumber,bankSwiftNumber,bankIbanNumber,name
    # def accounts
    #   Dinero::AccountsResource.new(self)
    # end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter @adapter
        conn.headers["Authorization"] = "Bearer #{@access_token}"
      end
    end
  end
end
