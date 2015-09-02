class ExperiencesController < ApplicationController

  def index

  end

  def show
    params[:id] = 1
    # Get experience from id params
    @experience = Experience.find(params[:id])
  end

end
