# frozen_string_literals: true

class Context
  ACCOUNT_STORE = {
    'joey' => '91',
    'mei' => '99'
  }.freeze

  def self.password(account)
    ACCOUNT_STORE[account]
  end
end
