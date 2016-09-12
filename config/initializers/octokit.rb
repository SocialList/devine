Octokit.configure do |c|
 c.client_id = ENV['OMNIAUTH_PROVIDER_KEY']
 c.client_secret = ENV['OMNIAUTH_PROVIDER_SECRET']
end
