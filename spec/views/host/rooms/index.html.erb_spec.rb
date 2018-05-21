require 'rails_helper'

RSpec.describe "host/rooms/index", type: :view do
  before(:each) do
    assign(:host_rooms, [
      Host::Room.create!,
      Host::Room.create!,
    ])
  end

  it "renders a list of host/rooms" do
    render
  end
end
