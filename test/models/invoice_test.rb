require_relative '../test_helper'

class InvoiceTest < ActiveSupport::TestCase
  def test_create_defaults
    customer = a Customer

    invoice = Invoice.create(
      customer: customer
    )

    assert_created invoice
    assert_created invoice.customer

    assert_equal 0, invoice.comments.count
    assert_equal 0, invoice.payments.count
    assert_nil invoice.estimate
  end
  
  def test_create_requirements
    invoice = Invoice.create

    assert_not_created invoice
    assert_errors_on invoice, :customer
  end

  def test_create_dummy
    invoice = an Invoice

    assert_created invoice
    assert_created invoice.customer

    assert_equal 0, invoice.comments.count
    assert_equal 0, invoice.payments.count
    assert_nil invoice.estimate
  end

  def test_add_comment
    invoice = a Invoice
    comment = invoice.comments.create_dummy
    
    assert_equal 1, invoice.comments.count

    assert_equal invoice.comments.first.id, comment.id 
    assert_equal invoice.comments.first.record.class, Invoice
    assert_equal invoice.comments.first.record.id, invoice.id
  end
  
  def test_add_estimate
  end

  def test_remove_estimate
  end

  def test_add_payment
  end

  def test_remove_payment
  end
end
