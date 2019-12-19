class Publics::RelationshipsController < ApplicationController
	before_action :authenticate_user!


  def follow
    current_user.follow(params[:id])
    redirect_to publics_users_path
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to publics_users_path
  end

  def show
  end
end
