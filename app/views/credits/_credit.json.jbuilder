json.extract! credit, :id, :debtor_id, :date, :amount, :rate, :arrears_rate, :payment_period_in_months, :created_at, :updated_at
json.url credit_url(credit, format: :json)
