class ApplicationController < ActionController::Base

  def dashboard
    render 'layouts/tailwind/dashboard'
  end
end
