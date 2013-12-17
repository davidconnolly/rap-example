ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Add more helper methods to be used by all tests here...
  # Add more helper methods to be used by all tests here...
  # Example usage:
  #   assert_exception_raised                                 do ... end
  #   assert_exception_raised ActiveRecord::RecordInvalid     do ... end
  #   assert_exception_raised Plugin::Error, 'error_message'  do ... end
  def assert_exception_raised(exception_class = nil, error_message = nil, &block)
    exception_raised = nil
    yield
  rescue => exception_raised
    if exception_class
      assert_equal exception_class, exception_raised.class, exception_raised.to_s
    else
      assert true
    end
    assert_equal error_message, exception_raised.to_s if error_message
  else
    flunk 'Exception was not raised'
  end

  def assert_created(model)
    assert_not_nil model, "Model was nil"
    assert model, "Model was not defined"
    assert_equal [ ], model.errors.full_messages
    assert model.valid?, "Model failed to validate"

    if (model.respond_to?(:new_record?))
      assert !model.new_record?, "Model is still a new record"
    elsif (model.respond_to?(:new?))
      assert !model.new?, "Model is still a new record"
    end
  end

  def assert_not_created(model)
    assert model, "Model was not defined"
    assert model.new_record?, "Model has been saved"
  end

  def assert_equal_ids(expected, actual, message = nil, &block)
    assert_equal expected.collect(&:id).sort_by(&:to_i), actual.collect(&:id).sort_by(&:to_i), message, &block
  end

  def assert_layout(layout)
    assert_equal layout, @response.layout
  end

  def assert_mapping(map)
    result_map = map.inject({ }) do |h, (k,v)|
      if (k and k.respond_to?(:freeze))
        k = k.freeze
      end
      h[k] = yield(k)
      h
    end
    differences = result_map.inject([ ]) do |a, (k,v)|
      if (v != map[k])
        a << k
      end
      a
    end
    assert_equal map, result_map, differences.collect { |s| "Input: #{s.inspect}\n  Expected: #{map[s].inspect}\n  Result:   #{result_map[s].inspect}\n" }.join('')
  end

  # Example usage:
  #   assert_errors_on @record, :field_1, :field_2
  def assert_errors_on(record, *attrs)
    found_attrs = [ ]
    record.errors.each{ |attr, error| found_attrs << attr }
    assert_equal attrs.flatten.collect(&:to_s).sort, found_attrs.uniq.collect(&:to_s).sort
  end

  # When you need to assert presence of a single attribute error
  #   assert_error_on @record, :field, 'expected error message'
  def assert_error_on(record, attribute, message = nil)
    error = record.errors.detect{|attr, error| attr.to_s == attribute.to_s}
    assert error
    assert error.include?(message), error.inspect if message
  end

  def assert_in_array(array, value)
    assert array.include?(value), "Value was not in the array"
  end

  def parse_json_response
    JSON.parse(@response.body)
  end
end
