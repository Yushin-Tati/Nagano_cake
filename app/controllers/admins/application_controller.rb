class Admins::ApplicationController < ApplicationController
  
  layout 'admins'
  
  before_action :authenticate_admin!
  
end
