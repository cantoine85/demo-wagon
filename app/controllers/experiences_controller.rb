class ExperiencesController < ApplicationController
#before_action :find_categories, only: [:create]

  def index

  end

  def show
    # Get experience from id params
    @experience = Experience.find(params[:id])

  end

  def create
    # Get experience from your inspirer
    experience = Experience.find(params[:experience_id])
    adventure = Adventure.find(experience.adventure)
    # Get inspirer (if actor nil, get creator)
    if experience.actor
      inspirer = experience.actor
    else
      inspirer = experience.inspirer
    end
    # Create your own experience
    # TO DO after migration done -> status in string :  done: params[:status]
    new_experience = Experience.new(adventure: adventure, actor:current_user, inspirer: inspirer)

    # Save your own experience and redirect to aleatory experience
    if new_experience.save
      redirect_to experience_path(experience.id + 1)
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

  def display_validate_past_experience

  end

end
