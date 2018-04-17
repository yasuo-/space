require 'rails_helper'

RSpec.describe "reservations/edit", type: :view do
  before(:each) do
    @reservation = assign(:reservation, Reservation.create!(
      :user => nil,
      :room => nil,
      :price => 1,
      :total => 1,
      :menu => "MyString"
    ))
  end

  it "renders the edit reservation form" do
    render

    assert_select "form[action=?][method=?]", reservation_path(@reservation), "post" do

      assert_select "input[name=?]", "reservation[user_id]"

      assert_select "input[name=?]", "reservation[room_id]"

      assert_select "input[name=?]", "reservation[price]"

      assert_select "input[name=?]", "reservation[total]"

      assert_select "input[name=?]", "reservation[menu]"
    end
  end
end
