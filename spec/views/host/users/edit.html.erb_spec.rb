require 'rails_helper'

RSpec.describe "host/users/edit", type: :view do
  before(:each) do
    @host_user = assign(:host_user, Host::User.create!)
  end

  it "renders the edit host_user form" do
    render

    assert_select "form[action=?][method=?]", host_user_path(@host_user), "post" do
    end
  end
end
