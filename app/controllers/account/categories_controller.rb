class Account::CategoriesController < ApplicationController
  # before_action :find_categories, only: [ :index ]

  def index
    #TODO
  end

  private

  # PM :
  # def categories_params
  #   params.require(:category).permit(:content)
  # end

  def find_categories
  # @category = current_user.experience
  end


end

 # - le nom de la catégorie
 # - la photo de la dernière experience vécue par le current_user dans la catégory
 # - la couleur de la catégorie
 # - le nombre total d'expérience de la catgéorie
 # - le nombre d'expériences done de la catégorie
