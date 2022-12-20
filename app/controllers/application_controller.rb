# frozen_string_literal: true

class ApplicationController < ActionController::Base
  VIEW_SORT_METHODS = ["id asc", "id desc", "name asc", "name desc"]

  def dashboard
    render("layouts/tailwind/dashboard")
  end
end
