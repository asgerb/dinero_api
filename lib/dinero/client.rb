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

    def accounts
      Dinero::AccountsResource.new(self)
    end

    def sales_credit_notes
      Dinero::SalesCreditNotesResource.new(self)
    end

    def business_goals
      Dinero::BusinessGoalsResource.new(self)
    end

    def state_of_account
      Dinero::StateOfAccountResource.new(self)
    end

    def entries
      Dinero::EntriesResource.new(self)
    end

    def files
      Dinero::FilesResource.new(self)
    end

    def integrations
      Dinero::IntegrationsResource.new(self)
    end

    def ledger_items
      Dinero::LedgerItemsResource.new(self)
    end

    def products
      Dinero::ProductsResource.new(self)
    end

    def purchase_vouchers
      Dinero::PurchaseVouchersResource.new(self)
    end

    def reports
      Dinero::ReportsResource.new(self)
    end

    def sms
      Dinero::SMSResource.new(self)
    end

    def vat_types
      Dinero::VATTypesResource.new(self)
    end

    def voucher_templates
      Dinero::VoucherTemplatesResource.new(self)
    end

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
