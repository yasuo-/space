require 'rails_helper'

RSpec.describe "Host::Users", type: :request do
  describe "GET /host_users" do
    it "works! (now write some real specs)" do
      get host_users_path
      expect(response).to have_http_status(200)
    end
  end
end
