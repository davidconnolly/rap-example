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

    assert_equal comment.id, estimate.comments.first.id
    assert_equal Estimate, estimate.comments.first.record.class
    assert_equal estimate.id, estimate.comments.first.record.id
  end
  
  def test_generate_invoice
    estimate = a Estimate
    estimate.generate_invoice!

    assert_created estimate.invoice
    assert_equal estimate.cost, estimate.invoice.cost_total
  end

  def test_generate_existing_invoice
    estimate = a Estimate
    invoice = estimate.generate_invoice!
    invoice_duplicate = estimate.generate_invoice!

    assert_equal estimate.cost, invoice.cost_total, invoice_duplicate.cost_total
    assert_equal invoice.id, invoice_duplicate.id
  end

  def test_update_invoice
    invoice = an Invoice
    estimate = Estimate.create(
      cost: 10000,
      customer: invoice.customer,
      invoice: invoice
    )
    
    assert_equal invoice.cost_total, 10000
    
    invoice.reload
    estimate.update_attributes(cost: 50000)
    
    invoice.reload
    assert_equal 50000, invoice.cost_total
  end

  def test_remove_from_invoice
    invoice = an Invoice
    estimate = Estimate.create(
      cost: 10000,
      customer: invoice.customer,
      invoice: invoice
    )

    invoice.reload
    estimate.destroy
    
    invoice.reload
    assert_equal 0, estimate.invoice.cost_total
  end

  def test_estimate_with_zero_cost
    customer = a Customer

    estimate = Estimate.create(
      cost: 0,
      customer: customer
    )

    assert_not_created estimate
    assert_errors_on estimate, :cost
  end

  def test_estimate_with_high_cost
    customer = a Customer

    estimate = Estimate.create(
      cost: 1000001,
      customer: customer
    )

    assert_not_created estimate
    assert_errors_on estimate, :cost
  end

end
