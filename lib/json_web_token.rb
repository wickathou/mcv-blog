# lib/json_web_token.rb
class JsonWebToken
  # Encode a payload with a secret key
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # Decode a token and retrieve the payload
  def self.decode(token)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
