class ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :authenticate_user!, :authorize_player
  attr_reader :current_user
end
