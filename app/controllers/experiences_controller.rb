class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_experience, only: [:show, :show_details, :create ]

  def index
    @experiences = Experience.all
    ids = Experience.all.map { |experience| experience.id }
    @experience = Experience.find(ids[rand(0...ids.size)])
  end

  def show
  end

  def show_details
  end

  def create
    # binding.pry
    # 1 - Get experience from your inspirer
    adventure = Adventure.find(@experience.adventure)
    # 2 - Get inspirer (if actor nil, get creator)
    if @experience.actor
      inspirer = @experience.actor
    else
      inspirer = @experience.inspirer
    end
    # 3 - Create your own experience
    # TO DO after migration done -> status in string :  done: params[:status]
    status = params[:status]
    @new_experience = Experience.new(adventure: adventure, actor: current_user, inspirer: inspirer, status: status)
    #binding.pry
    # 4 - Save your own experience and redirect to aleatory experience
    ids = Experience.all.map { |experience| experience.id }
    @other_experience = Experience.find(ids[rand(0...ids.size)])
    if @new_experience.save
      respond_to do |format|
        format.html { redirect_to experiences_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :back }
        format.js
      end
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end



end

  # def edit
  #   if @experience.token == cookies[:temporary_exp_token]
  #     display_validate_past_experience
  #   else
  #     display_classical_edit_form
  #   end
  # end

  # def find_categories
  #   @categories = []
  #   params[:experience][:category_ids].each do | category_id |
  #     @categories << Category.find(category_id) unless category_id = ""
  #   end
  # end
#
  # def display_validate_past_experience
#
  # end
