# frozen_string_literals: true

class RasTokenDao
  def random_token(account)
    (0..9)
      .to_a
      .sample(6)
      .map(&:to_s)
      .join
      .tap { |code| puts "random code: #{code}" }
  end
end