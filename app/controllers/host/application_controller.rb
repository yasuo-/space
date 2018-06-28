class Host::ApplicationController < ApplicationController
  layout 'host_application'
  before_action :authenticate_user!
end
