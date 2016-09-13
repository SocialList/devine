require 'rails_helper'

RSpec.describe GithubProfile, type: :model do
  it { should belong_to(:user) }
end
