class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_filter :disable_footbar, only: :home

  def home

  end
end
