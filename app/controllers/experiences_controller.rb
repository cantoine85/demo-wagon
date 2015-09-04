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

    # Associer un utilisateur à l'expérience
    if user_signed_in?
      @experience.user = current_user
    else
      @experience.token = GENERATE_TOKEN
      cookies[:temporary_exp_token] = @experience.token
    end

    # Si l'expérience passe les validation, l'enregistrer dans la db
    # et rediriger sur la vue show de l'expérience
    if @experience.save
      # Préciser la référence de l'expérience initiale
      @experience.author_experience = @experience.id
      redirect_to experience_path(@experience)
    else
      render :new # renvoie le formulaire de création de l'expérience
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
