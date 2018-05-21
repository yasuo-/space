require 'rails_helper'

RSpec.describe "host/rooms/edit", type: :view do
  before(:each) do
    @host_room = assign(:host_room, Host::Room.create!)
  end

  it "renders the edit host_room form" do
    render

    assert_select "form[action=?][method=?]", host_room_path(@host_room), "post" do
    end
  end
end
