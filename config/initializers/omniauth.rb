# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :github, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret
# end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret, scope: "user,repo,gist"

  OmniAuth.config.logger = Rails.logger
  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end
