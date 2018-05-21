require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  before(:each) do
    @room = assign(:room, Room.create!(
      :home_type => "Home Type",
      :room_type => "Room Type",
      :summary => "MyText",
      :address => "Address",
      :is_tv => false,
      :is_kitchen => false,
      :is_air => false,
      :is_heating => false,
      :is_internet => false,
      :accomodate => 2,
      :bedroom => 3,
      :bathroom => 4,
      :sheet => 5,
      :price => 6,
      :active => false,
      :user_id => 7,
      :listing_name => "Listing Name",
      :latitude => 8.5,
      :longitude => 9.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Home Type/)
    expect(rendered).to match(/Room Type/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/Listing Name/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/9.5/)
  end
end
