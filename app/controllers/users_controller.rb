class UsersController < ApplicationController

  def show
    @hello = 'Hello, world! One more time!'
    @user = User.all.map(&:username)
  end
end
