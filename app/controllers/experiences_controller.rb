class ExperiencesController < ApplicationController
before_action :find_category, only: [:create]

  def index

  end


  def new
    @experience = Experience.new
  end

  def create

    # Récupérer les paramètres de l'expérience créée
    @experience = Experience.new(experience_params)
    # Préciser la référence de l'expérience initiale
    @experience.author_experience = @experience
    # Associer un utilisateur à l'expérience
    @experience.user = current_user
    # Associer une catégorie à l'expérience
    @experience.categories << find_category

    # Si l'expérience passe les validation, l'enregistrer dans la db
    # et rediriger sur la vue show de l'expérience
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new # renvoie le formulaire de création de l'expérience
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :description, :startdate, :enddate, :address, :category)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

end
