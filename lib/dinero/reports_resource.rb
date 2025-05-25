module Dinero
  class ReportsResource < Resource
    def saldo(accounting_year, **params)
      response = get("v1/#{organization_id}/#{accounting_year}/reports/saldo", params: params)
      response.body
    end

    def result(accounting_year, **params)
      response = get("v1/#{organization_id}/#{accounting_year}/reports/result", params: params)
      response.body
    end

    def primo(accounting_year, **params)
      response = get("v1/#{organization_id}/#{accounting_year}/reports/primo", params: params)
      response.body
    end

    def balance(accounting_year, **params)
      response = get("v1/#{organization_id}/#{accounting_year}/reports/balance", params: params)
      response.body
    end
  end
end
