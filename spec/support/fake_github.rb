require 'sinatra/base'

class FakeGitHub < Sinatra::Base

  get '/repositories/:id' do
    json_response 200, 'repos.json'
  end

  get '/user/repos' do
    json_response 200, 'user.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
