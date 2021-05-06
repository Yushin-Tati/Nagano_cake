class Customers::ApplicationController < ApplicationController
  
  before_action :authenticate_customer!, if: :use_auth?
  
  private
  

  def use_auth?
    unless (controller_name == 'items' && ( action_name == 'index' || action_name == 'show' )) || controller_name == 'homes'
      true
    end
  end
  
end