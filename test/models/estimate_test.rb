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
  end

end
