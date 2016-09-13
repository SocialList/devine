describe User do

  before(:each) { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }

  it { should have_many(:projects) }

  it { should have_one(:github_profile) }

  it "#name returns a string" do
    expect(@user.name).to match 'Test User'
  end

end
