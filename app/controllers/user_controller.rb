class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = UserDecorator.new(current_user)
  end
end
