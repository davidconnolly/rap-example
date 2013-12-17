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
      amount: 10000
    )
    
    assert_equal 10000, invoice.amount_paid
    
    invoice.reload
    payment.update_attributes(amount: 50000)
    
    invoice.reload
    assert_equal 50000, invoice.amount_paid
  end

  def test_remove_from_invoice
    invoice = an Invoice
    payment = Payment.create(
      invoice: invoice,
      amount: 10000
    )
    
    assert_equal invoice.amount_paid, 10000
    
    invoice.reload
    payment.destroy
    
    invoice.reload
    assert_equal 0, invoice.amount_paid
  end

  def test_payment_with_low_cost
    invoice = a Invoice

    payment = Payment.create(
      amount: -1000001,
      invoice: invoice
    )

    assert_not_created payment
    assert_errors_on payment, :amount
  end

  def test_payment_with_zero_cost
    invoice = a Invoice

    payment = Payment.create(
      amount: 0,
      invoice: invoice
    )

    assert_not_created payment
    assert_errors_on payment, :amount
  end

  def test_estimate_with_high_cost
    invoice = a Invoice

    payment = Payment.create(
      amount: 1000001,
      invoice: invoice
    )

    assert_not_created payment
    assert_errors_on payment, :amount  
  end
end
