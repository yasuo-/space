require 'rails_helper'

RSpec.describe "host/users/index", type: :view do
  before(:each) do
    assign(:host_users, [
      Host::User.create!,
      Host::User.create!
    ])
  end

  it "renders a list of host/users" do
    render
  end
end
