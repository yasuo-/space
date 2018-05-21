require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  before(:each) do
    assign(:rooms, [
      Room.create!(
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
      ),
      Room.create!(
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
      ),
    ])
  end

  it "renders a list of rooms" do
    render
    assert_select "tr>td", :text => "Home Type".to_s, :count => 2
    assert_select "tr>td", :text => "Room Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "Listing Name".to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => 9.5.to_s, :count => 2
  end
end
