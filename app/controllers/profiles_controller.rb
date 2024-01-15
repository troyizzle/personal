class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: %i[show]

  def show; end

  private

  def load_user
    @user = User.find_by!(username: params[:username])
  end
end
