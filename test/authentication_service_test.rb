# frozen_string_literals: true

require 'minitest/autorun'
require 'mocha/minitest'

require_relative '../lib/loads'

class AuthenticationServiceTest < MiniTest::Unit::TestCase
  def setup
    @profile = stub('object')
    @token = stub('object')
    @target = AuthenticationService.new(@profile, @token)
  end

  def test_is_valid
    given_password('joey', '91')
    given_token('0' * 6)
    should_be_valid('joey', '91000000')
  end

  def test_is_invalid
    given_password('joey', '91')
    given_token('0' * 6)
    should_be_invalid('joey', 'wrong password')
  end

  private

  def should_be_invalid(account, password)
    actual = @target.valid?(account, password)
    assert_equal false, actual
  end

  def should_be_valid(account, password)
    actual = @target.valid?(account, password)
    assert_equal true, actual
  end

  def given_token(token)
    @token.expects(:gen_random).returns(token)
  end

  def given_password(account, password)
    @profile.expects(:password).with(account).returns(password)
  end
end
