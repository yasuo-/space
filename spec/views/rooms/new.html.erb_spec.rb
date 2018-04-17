require 'rails_helper'

RSpec.describe "rooms/new", type: :view do
  before(:each) do
    assign(:room, Room.new(
      :home_type => "MyString",
      :room_type => "MyString",
      :summary => "MyText",
      :address => "MyString",
      :is_tv => false,
      :is_kitchen => false,
      :is_air => false,
      :is_heating => false,
      :is_internet => false,
      :accomodate => 1,
      :bedroom => 1,
      :bathroom => 1,
      :sheet => 1,
      :price => 1,
      :active => false,
      :user_id => 1,
      :listing_name => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new room form" do
    render

    assert_select "form[action=?][method=?]", rooms_path, "post" do

      assert_select "input[name=?]", "room[home_type]"

      assert_select "input[name=?]", "room[room_type]"

      assert_select "textarea[name=?]", "room[summary]"

      assert_select "input[name=?]", "room[address]"

      assert_select "input[name=?]", "room[is_tv]"

      assert_select "input[name=?]", "room[is_kitchen]"

      assert_select "input[name=?]", "room[is_air]"

      assert_select "input[name=?]", "room[is_heating]"

      assert_select "input[name=?]", "room[is_internet]"

      assert_select "input[name=?]", "room[accomodate]"

      assert_select "input[name=?]", "room[bedroom]"

      assert_select "input[name=?]", "room[bathroom]"

      assert_select "input[name=?]", "room[sheet]"

      assert_select "input[name=?]", "room[price]"

      assert_select "input[name=?]", "room[active]"

      assert_select "input[name=?]", "room[user_id]"

      assert_select "input[name=?]", "room[listing_name]"

      assert_select "input[name=?]", "room[latitude]"

      assert_select "input[name=?]", "room[longitude]"
    end
  end
end
