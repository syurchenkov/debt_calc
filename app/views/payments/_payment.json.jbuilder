json.extract! payment, :id, :credit_id, :amount, :date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
