class Customer::Client < ApplicationRecord
  belongs_to :account
  belongs_to :rental
  belongs_to :sale
end
