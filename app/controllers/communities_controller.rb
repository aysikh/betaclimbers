class CommunitiesController < ApplicationController
  before_action :find_community, :no_repeats, only: [:show]

  before_action :authorized

  def index
    @communities = Community.all 
  end

  def show
    @community = Community.find(params[:id])
    cookies[:community_id] = @community.id
    @climbers = @community.climbers.uniq
  end

  private

  def no_repeats
    # byebug
    @community = Community.find(params[:id])
    @community.climbers.uniq
  end

  def find_community
    @community = Community.find(params[:id])
  end

end
