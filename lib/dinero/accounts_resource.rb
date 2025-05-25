module Dinero
  class AccountsResource < Resource
    def entry
      EntryAccountsResource.new(client)
    end

    def purchase
      PurchaseAccountsResource.new(client)
    end

    def deposit
      DepositAccountsResource.new(client)
    end
  end
end
