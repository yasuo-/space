require 'rails_helper'

RSpec.describe "host/users/show", type: :view do
  before(:each) do
    @host_user = assign(:host_user, Host::User.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
