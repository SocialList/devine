class GithubController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index, :show]

  def index
    client = Octokit::Client.new(:access_token => current_user.github_profile.access_token)
    @repos = client.repos
  end


end
