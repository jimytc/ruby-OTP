# frozen_string_literals: true

class AuthenticationService
  def valid?(account, password)
    profile_dao = ProfileDao.new
    password_for_dao = profile_dao.password(account)

    rsa_token_dao = RasTokenDao.new
    random_code = rsa_token_dao.random_token(account)

    valid_password = password_for_dao + random_code
    is_valid = valid_password == password

    if is_valid
      true
    else
      false
    end
  end
end