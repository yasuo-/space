require 'rails_helper'

RSpec.describe "reservations/new", type: :view do
  before(:each) do
    assign(:reservation, Reservation.new(
      :user => nil,
      :room => nil,
      :price => 1,
      :total => 1,
      :menu => "MyString"
    ))
  end

  it "renders new reservation form" do
    render

    assert_select "form[action=?][method=?]", reservations_path, "post" do
      assert_select "input[name=?]", "reservation[user_id]"

      assert_select "input[name=?]", "reservation[room_id]"

      assert_select "input[name=?]", "reservation[price]"

      assert_select "input[name=?]", "reservation[total]"

      assert_select "input[name=?]", "reservation[menu]"
    end
  end
end
