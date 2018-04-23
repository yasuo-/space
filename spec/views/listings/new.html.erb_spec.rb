require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :home_type => "MyString",
      :listing_type => "MyString",
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

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do
      assert_select "input[name=?]", "listing[home_type]"

      assert_select "input[name=?]", "listing[listing_type]"

      assert_select "textarea[name=?]", "listing[summary]"

      assert_select "input[name=?]", "listing[address]"

      assert_select "input[name=?]", "listing[is_tv]"

      assert_select "input[name=?]", "listing[is_kitchen]"

      assert_select "input[name=?]", "listing[is_air]"

      assert_select "input[name=?]", "listing[is_heating]"

      assert_select "input[name=?]", "listing[is_internet]"

      assert_select "input[name=?]", "listing[accomodate]"

      assert_select "input[name=?]", "listing[bedroom]"

      assert_select "input[name=?]", "listing[bathroom]"

      assert_select "input[name=?]", "listing[sheet]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[active]"

      assert_select "input[name=?]", "listing[user_id]"

      assert_select "input[name=?]", "listing[listing_name]"

      assert_select "input[name=?]", "listing[latitude]"

      assert_select "input[name=?]", "listing[longitude]"
    end
  end
end
