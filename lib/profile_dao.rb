# frozen_string_literals: true

class ProfileDao
  def password(account)
    Context.password(account)
  end
end
