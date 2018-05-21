require 'rails_helper'

RSpec.describe "reservations/index", type: :view do
  before(:each) do
    assign(:reservations, [
      Reservation.create!(
        :user => nil,
        :room => nil,
        :price => 2,
        :total => 3,
        :menu => "Menu"
      ),
      Reservation.create!(
        :user => nil,
        :room => nil,
        :price => 2,
        :total => 3,
        :menu => "Menu"
      ),
    ])
  end

  it "renders a list of reservations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Menu".to_s, :count => 2
  end
end
