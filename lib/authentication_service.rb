# frozen_string_literals: true

class AuthenticationService
  attr_reader :profile, :token

  def initialize(profile = nil, token = nil)
    @profile = profile || ProfileDao.new
    @token = token || RasTokenDao.new
  end

  def valid?(account, password)
    # 根據 account 取得自訂密碼
    password_for_dao = profile.password(account)

    # 根據 account 取得 RSA token 目前的亂數
    random_code = token.gen_random(account)

    # 驗證傳入的 password 是否等於自訂密碼 + RSA token亂數
    valid_password = password_for_dao + random_code
    is_valid = valid_password == password

    if is_valid
      true
    else
      false
    end
  end
end