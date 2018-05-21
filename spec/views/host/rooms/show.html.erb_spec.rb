require 'rails_helper'

RSpec.describe "host/rooms/show", type: :view do
  before(:each) do
    @host_room = assign(:host_room, Host::Room.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
