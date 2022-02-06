# frozen_string_literal: true

module ApplicationHelper
  EMAIL_REGEX = /\A[a-z0-9+\-_.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_REGEX = /([0-9]{3}){3}|([0-9]{3}\s){3}/
end
