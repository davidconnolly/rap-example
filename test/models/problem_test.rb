require_relative '../test_helper'

class ProblemTest < ActiveSupport::TestCase
  def test_create_defaults
    vehicle = a Vehicle

    problem = Problem.create(
      description: "This is a test description of the problem.",
      vehicle: vehicle
    )

    assert_created problem
    assert_created problem.vehicle

    assert_equal 0, problem.comments.count
    assert_nil problem.estimate
  end
  
  def test_create_requirements
    problem = Problem.create

    assert_not_created problem
    assert_errors_on problem, :description, :vehicle
  end

  def test_create_dummy
    problem = a Problem

    assert_created problem
    assert_created problem.vehicle

    assert_equal 0, problem.comments.count
    assert_nil problem.estimate
  end

  def test_add_comment
    problem = a Problem
    comment = problem.comments.create_dummy
    
    assert_equal 1, problem.comments.count

    assert_equal comment.id, problem.comments.first.id
    assert_equal Problem, problem.comments.first.record.class
    assert_equal problem.id, problem.comments.first.record.id
  end

  def test_add_estimate
    problem = a Problem
    estimate = an Estimate

    problem.estimate = estimate

    assert_created problem.estimate
    assert_equal estimate.id, problem.estimate.id
  end

end
