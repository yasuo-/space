require 'rails_helper'

RSpec.describe "host/rooms/new", type: :view do
  before(:each) do
    assign(:host_room, Host::Room.new)
  end

  it "renders new host_room form" do
    render

    assert_select "form[action=?][method=?]", host_rooms_path, "post" do
    end
  end
end
