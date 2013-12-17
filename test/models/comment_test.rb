require_relative '../test_helper'

class CommentTest < ActiveSupport::TestCase
  def test_create_defaults
    invoice = an Invoice

    comment = Comment.create(
      note: "This is a comment.",
      record: invoice
    )

    assert_created comment
  end
  
  def test_create_requirements
    comment = Comment.create

    assert_not_created comment
    assert_errors_on comment, :note, :record
  end

  def test_create_dummy
    comment = a Comment, :with_record

    assert_created comment
  end
end
