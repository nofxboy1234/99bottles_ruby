# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/my_bottles'

class BottleNumberTest < Minitest::Test
  def test_returns_correct_class_for_given_number
    # 0, 1, 6 are special
    assert_equal BottleNumber0, BottleNumber.for(0).class
    assert_equal BottleNumber1, BottleNumber.for(1).class
    assert_equal BottleNumber6, BottleNumber.for(6).class

    # Other numbers get the default
    assert_equal BottleNumber, BottleNumber.for(3).class
    assert_equal BottleNumber, BottleNumber.for(7).class
    assert_equal BottleNumber, BottleNumber.for(43).class
  end
end
