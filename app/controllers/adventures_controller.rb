class AdventuresController < ApplicationController

  before_action :set_adventure, only: [:show, :edit, :update, :destroy]

  def index
    # @adventures = Adventure.search(params[:search])
    if params[:search]
      @adventures = Adventure.where("address like ?", "%#{params[:search]}%")
    else
      @adventures = Adventure.all
    end
    # adventures_with_coordinates = @adventures.select {|adventure| adventure.latitude && adventure.longitude}
    # @markers = Gmaps4rails.build_markers(adventures_with_coordinates) do |adventure, marker|
    #   marker.lat adventure.latitude
    #   marker.lng adventure.longitude
  end

  def new
    @adventure = Adventure.new
  end

  def create
    # Récupérer les paramètres de l'aventure créée
    @adventure = Adventure.new(adventure_params)

    # Associer un utilisateur à l'aventure
    if user_signed_in?
      @adventure.user = current_user
    else
      @adventure.token = GENERATE_TOKEN
      cookies[:temporary_exp_token] = @adventure.token
    end

    # Si l'expérience passe les validation, l'enregistrer dans la db
    # et rediriger sur la vue show de l'expérience
    if @adventure.save
      redirect_to adventure_path(@adventure)
    else
      render :new # renvoie le formulaire de création de l'expérience
    end
  end

  def show
    #@adventure_coordinates = { lat: @adventure.latitude, lng: @adventure.longitude }
  end


  def edit
    if @adventure.token == cookies[:temporary_exp_token]
      display_validate_past_adventure
    else
      display_classical_edit_form
    end
  end

  def update
    if @adventure.update(adventure_params)
      redirect_to adventures_path(@adventure)
    else
      render :edit
    end
  end

  def destroy
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
    redirect_to adventures_path
  end

  # def edit
  #   if @adventure.token == cookies[:temporary_exp_token]
  #     display_validate_past_adventure
  #   else
  #     display_classical_edit_form
  #   end
  # end

  private

  def adventure_params
    params.require(:adventure).permit(:title, :category, :description, :picture, :start_date, :end_date, :address, :duration)
  end

  def set_adventure
    @adventure = Adventure.find(params[:id])
  end

  def display_validate_past_adventure

  end

  def display_classical_edit_form

  end
end