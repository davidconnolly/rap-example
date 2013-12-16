require_relative '../test_helper'

class PaymentTest < ActiveSupport::TestCase
  def test_create_defaults
    invoice = a Invoice

    payment = Payment.create(
      invoice: invoice,
      amount: 1000
    )

    assert_created payment
    assert_created payment.invoice
  end
  
  def test_create_requirements
    payment = Payment.create

    assert_not_created payment
    assert_errors_on payment, :invoice, :amount
  end

  def test_create_dummy
    payment = a Payment

    assert_created payment
    assert_created payment.invoice
  end

  def test_update_invoice
    invoice = an Invoice
    payment = Payment.create(
      invoice: invoice,
      amount: 1000
    )
    
    assert_equal payment.invoice.amount_paid, 1000
    payment.update_attributes(amount: 50000)
    assert_equal payment.invoice.amount_paid, 50000
  end

  def test_remove_from_invoice
    invoice = an Invoice
    payment = Payment.create(
      invoice: invoice,
      amount: 1000
    )

    payment.destroy

    assert_equal payment.invoice.amount_paid, 0
  end

  def test_invalid_payment
    invoice = a Invoice

    payment = Payment.create(
      invoice: invoice,
      amount: 0
    )

    assert_not_created payment
    #how do I test for a specific error?
    #assert_errors_on payment, :?????
  end
end
