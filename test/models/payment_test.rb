require_relative '../test_helper'

class PaymentTest < ActiveSupport::TestCase
  def test_create_defaults
    invoice = a Invoice

    payment = Payment.create(
      invoice: invoice
    )

    assert_created payment
    assert_created payment.invoice
  end
  
  def test_create_requirements
    payment = Payment.create

    assert_not_created payment
    assert_errors_on payment, :invoice
  end

  def test_create_dummy
    payment = a Payment

    assert_created payment
    assert_created payment.invoice
  end
end
