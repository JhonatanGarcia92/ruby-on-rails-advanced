class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

 # protect_from_forgery with: :exception, unless: -> { request.format.json? }
end
