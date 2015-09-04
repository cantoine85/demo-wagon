module Account
  class ExperiencesController < ApplicationController

    def new

    end

    def create

    end

    def index
      if Experience.where(actor:current_user) != []
        @experiences = Experience.where(actor:current_user)
      else
        @message = "Vous n'avez pas encore d'expériences dans votre vision board"
      end

    end

    def detail
    @alert_message = "#{@experience.title}"
    @experience_coordinates = { lat: @experience.latitude, lng: @experience.longitude }
    end

  end
end



#   private

#   # PM :
#   # def categories_params
#   #   params.require(:category).permit(:content)
#   # end

#   def find_categories
#   # @category = current_user.experience
#   end


# end

#  # - le nom de la catégorie
#  # - la photo de la dernière experience vécue par le current_user dans la catégory
#  # - la couleur de la catégorie
#  # - le nombre total d'expérience de la catgéorie
#  # - le nombre d'expériences done de la catégorie
