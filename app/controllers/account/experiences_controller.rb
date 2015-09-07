module Account
  class ExperiencesController < ApplicationController

    def new

    end

    def create

    end

    def index
      if Experience.where(actor:current_user) != []
        @experiences = Experience.where(actor:current_user)
        @categories = get_categories(@experiences)
      else
        @message = "Vous n'avez pas encore d'expériences dans votre vision board"
      end
    end

    def todo
      @experiences = Experience.where(actor:current_user)
    end

    def detail
      @alert_message = "#{@experience.title}"
      @experience_coordinates = { lat: @experience.latitude, lng: @experience.longitude }
    end

    private
    def get_categories (experiences)
      categories = experiences.map {|experience| experience.adventure.category}
      categories = categories.uniq
    end

  end
end


