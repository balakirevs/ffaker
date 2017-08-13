# encoding: utf-8

require 'helper'

class TestBusinnes < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
      FFaker::Business,
      :credit_card_number, :credit_card_expiry_date, :credit_card_type
  )

  def setup
    @tester = FFaker::Business
    @credit_card_number_list = fetch_sample(CREDIT_CARD_NUMBERS)
    @credit_card_types = fetch_sample(CREDIT_CARD_TYPES)
    @minimum_expiry_date = ::Date.today + 365
    @maximum_expiry_date = ::Date.today + (365 * 4)
  end

  def test_credit_card_number
    number1 = @tester.credit_card_number
    number2 = @tester.credit_card_number
    assert @credit_card_number_list.include?(number1)
    assert @credit_card_number_list.include?(number2)
  end

  def test_credit_card_type
    type1 = @tester.credit_card_type
    type2 = @tester.credit_card_type
    assert @credit_card_types.include?(type1)
    assert @credit_card_types.include?(type2)
  end

  def test_credit_card_expiry_date
    date1 = @tester.credit_card_expiry_date
    date2 = @tester.credit_card_expiry_date
    assert date1.between?(@minimum_expiry_date, @maximum_expiry_date)
    assert date2.between?(@minimum_expiry_date, @maximum_expiry_date)
  end
end
