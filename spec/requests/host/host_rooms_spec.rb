require 'rails_helper'

RSpec.describe "Host::Rooms", type: :request do
  describe "GET /host_rooms" do
    it "works! (now write some real specs)" do
      get host_rooms_path
      expect(response).to have_http_status(200)
    end
  end
end
