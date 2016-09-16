require 'sinatra/base'

class FakeGitHub < Sinatra::Base

  get '/repositories/:id' do
    if params[:id] == 66507460
      json_response 200, 'repos.json'
    else
      json_response 200, 'repos11111111.json'
    end
  end

  get '/user/repos' do
    json_response 200, 'user.json'
  end

  get '/user/:id' do
    json_response 200, 'user_general.json'
  end


  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
