class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_experience, only: [:show, :show_details, :create ]
  before_action :set_current_user_adventures, only: [:index, :create ]

  def index
    # @experiences = Experience.all
    @message = nil
    # experiences = Experience.where("inspirer_id != #{current_user.id} or actor_id != #{current_user.id}")

    if @adventures != []
      experiences = Experience.where("adventure_id NOT IN (?)", @adventures)
    else
      experiences = Experience.all
    end

    # ids = experiences.map { |experience| experience.id }
    if experiences != []
      # @experience = Experience.find(ids[rand(0...ids.size)])
      @experience = experiences.sample
    else
      @message = "nous n'avons plus d'expériences à vous proposer. Revenez très vite pour de nouvelles aventures"
    end
    # binding.pry
  end

  def show
    #TODO
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
    # 4' - Select experiences where adventure != to adventures current_user knows
    @adventures << adventure.id

    experiences = Experience.where("adventure_id NOT IN (?)", @adventures)


    ids = experiences.map { |experience| experience.id }
    if ids != []

      @other_experience = Experience.find(ids[rand(0...ids.size)])
    else
      @other_experience = nil
      @message = "nous n'avons plus d'expériences à vous proposer. Revenez très vite pour de nouvelles aventures"
    end

    # binding.pry
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

  def set_current_user_adventures
    experiences = Experience.where("inspirer_id = #{current_user.id} or actor_id = #{current_user.id}")
    @adventures = []
    experiences.each do |experience|
      @adventures << experience.adventure_id
    end
    @adventures.uniq!
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
