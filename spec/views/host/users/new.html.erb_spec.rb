require 'rails_helper'

RSpec.describe "host/users/new", type: :view do
  before(:each) do
    assign(:host_user, Host::User.new)
  end

  it "renders new host_user form" do
    render

    assert_select "form[action=?][method=?]", host_users_path, "post" do
    end
  end
end
