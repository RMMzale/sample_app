# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure the secrets in this file are kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('secret')
  if File.exist?(token_file)
  #Use the existing token.
  File.read(token_file).chomp
  else
  #Generate a new token and store it in token_files.
  token = SecureRandom.hex(64)
  File.write(token_file, token)
  token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
  

development:
  secret_key_base: dca7c2726708f7c2f1cd0477526a3528a50907e76bd46a8f1784a2996a8743be600cc88100273d79d5f7b0dbff286609298e8a922f71046e2c8e4dfa235e4247

test:
  secret_key_base: 222667531af81446e31e80a6c862afb0d3f3ec4a496765953fb765a4e2a32bcc121560a283c1f7fe8c2aaab5c456c3dc4a6fbbfbd68fbac494e14ff3ac316050

# Do not keep production secrets in the repository,
# instead read values from the environment.
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
