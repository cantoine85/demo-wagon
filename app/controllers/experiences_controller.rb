class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_experience, only: [:show, :show_details, :create ]

  def index
    @experiences = Experience.all
  end

  def show
  end

  def show_details
  end

  def create
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
    new_experience = Experience.new(adventure: adventure, actor:current_user, inspirer: inspirer)

    # 4 - Save your own experience and redirect to aleatory experience
    if new_experience.save
      redirect_to experience_path(@experience.id + 1)
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
