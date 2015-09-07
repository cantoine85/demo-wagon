module Account
  class ExperiencesController < ApplicationController

    def new

    end

    def create

    end

    def index
      @experiences = Experience.where(actor:current_user)
      @experiences_done = @experiences.where(status: "to_do")
      @experiences_todo = @experiences.where(status: "done")
    end

    def todo
      @experiences = Experience.where(actor:current_user)
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
