class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos
  end
end
