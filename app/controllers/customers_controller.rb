class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  # Returns all customers in alphabetical order.
  def alphabetized
    @customers = Customer.order(:full_name)
  end

  # Returns only the customers who are missing emails.
  def missing_email
    @customers = Customer.where(email_address: [nil, ""])
  end
end
