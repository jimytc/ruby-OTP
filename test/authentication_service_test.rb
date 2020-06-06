# frozen_string_literals: true

require 'minitest/autorun'

require_relative '../lib/loads'

class AuthenticationServiceTest < MiniTest::Unit::TestCase
  def test_is_valid
    target = AuthenticationService.new
    actual = target.valid?('joey', '910000')
    assert_equal true, actual
  end
end