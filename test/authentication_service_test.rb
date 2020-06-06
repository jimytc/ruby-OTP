# frozen_string_literals: true

require 'minitest/autorun'

require_relative '../lib/loads'

class AuthenticationServiceTest < MiniTest::Unit::TestCase
  def test_is_valid
    target = AuthenticationService.new(FakeProfile.new, FakeToken.new)
    actual = target.valid?('joey', '91000000')
    assert_equal true, actual
  end
end

class FakeProfile
  def password(account)
    '91'
  end
end

class FakeToken
  def gen_random(account)
    '000000'
  end
end
