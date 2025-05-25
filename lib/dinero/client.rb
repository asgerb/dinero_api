require "faraday"

module Dinero
  class Client
    BASE_URL = "https://api.dinero.dk"

    attr_reader :organization_id

    def initialize(organization_id:, api_key:, client_id:, client_secret:, adapter: Faraday.default_adapter)
      @access_token = Dinero::Authentication.access_token(api_key: api_key, client_id: client_id, client_secret: client_secret)
      @adapter = adapter
      @organization_id = organization_id
    end

    def contacts = Dinero::ContactsResource.new(self)

    def invoices = Dinero::InvoicesResource.new(self)

    def sales = Dinero::SalesResource.new(self)

    def organizations = Dinero::OrganizationsResource.new(self)

    def accounts = Dinero::AccountsResource.new(self)

    def sales_credit_notes = Dinero::SalesCreditNotesResource.new(self)

    def business_goals = Dinero::BusinessGoalsResource.new(self)

    def state_of_account = Dinero::StateOfAccountResource.new(self)

    def entries = Dinero::EntriesResource.new(self)

    def files = Dinero::FilesResource.new(self)

    def integrations = Dinero::IntegrationsResource.new(self)

    def ledger_items = Dinero::LedgerItemsResource.new(self)

    def products = Dinero::ProductsResource.new(self)

    def purchase_vouchers = Dinero::PurchaseVouchersResource.new(self)

    def reports = Dinero::ReportsResource.new(self)

    def sms = Dinero::SMSResource.new(self)

    def vat_types = Dinero::VATTypesResource.new(self)

    def voucher_templates = Dinero::VoucherTemplatesResource.new(self)

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
