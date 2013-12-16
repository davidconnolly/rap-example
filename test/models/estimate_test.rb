require_relative '../test_helper'

class EstimateTest < ActiveSupport::TestCase
  def test_create_defaults
    customer = a Customer

    estimate = Estimate.create(
      cost: 1000,
      customer: customer
    )

    assert_created estimate
    assert_created estimate.customer

    assert_equal 0, estimate.comments.count
    assert_equal 0, estimate.problems.count
    assert_nil estimate.invoice
  end
  
  def test_create_requirements
    estimate = Estimate.create

    assert_not_created estimate
    assert_errors_on estimate, :cost, :customer
  end

  def test_create_dummy
    estimate = an Estimate

    assert_created estimate
    assert_created estimate.customer

    assert_equal 0, estimate.comments.count
    assert_equal 0, estimate.problems.count
    assert_nil estimate.invoice
  end

  def test_add_comment
    estimate = a Estimate
    comment = estimate.comments.create_dummy
    
    assert_equal 1, estimate.comments.count

    assert_equal estimate.comments.first.id, comment.id 
    assert_equal estimate.comments.first.record.class, Estimate
    assert_equal estimate.comments.first.record.id, estimate.id
  end
  
  def test_generate_invoice
    estimate = a Estimate
    estimate.generate_invoice

    assert_created estimate.invoice
    assert_equal estimate.invoice.cost_total, estimate.cost
  end

  def test_generate_existing_invoice
    estimate = a Estimate
    invoice1 = estimate.generate_invoice
    invoice2 = estimate.generate_invoice

    assert_equal estimate.cost, invoice1.cost_total, invoice2.cost_total
    assert_equal invoice1.id, invoice2.id
  end

  def test_update_invoice
    invoice = an Invoice
    customer = a Customer
    estimate = Estimate.create(
      cost: 10000,
      customer: customer,
      invoice: invoice
    )
    
    assert_equal estimate.invoice.cost_total, 10000
    estimate.update_attributes(cost: 50000)
    assert_equal estimate.invoice.cost_total, 50000
  end

  def test_remove_from_invoice
    invoice = an Invoice
    customer = a Customer
    estimate = Estimate.create(
      cost: 10000,
      customer: customer,
      invoice: invoice
    )

    estimate.destroy

    assert_equal estimate.invoice.cost_total, 0
  end

  def test_invalid_estimate
    customer = a Customer

    estimate = Estimate.create(
      cost: 0,
      customer: customer
    )

    assert_not_created estimate
    #how do I test for a specific error?
    #assert_errors_on estimate, :?????
  end

end
