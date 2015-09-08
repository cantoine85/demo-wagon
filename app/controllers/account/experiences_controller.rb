module Account
  class ExperiencesController < ApplicationController
    def new
    end

    def create
    end

    def index
      if Experience.where(actor:current_user)#.where(status: "done") != []
        @experiences = Experience.where(actor:current_user)#.where(status: "done")
        @categories = get_categories(@experiences)
        @hash_count = hash_number_of_experiences_per_category(@experiences)
      else
        @message = "Vous n'avez pas encore d'expériences vécues dans votre vision board"
      end
    end

    def todo
      @experiences = Experience.where(actor: current_user).where(status: "to_do")
      @categories = get_categories(@experiences)
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

    def hash_number_of_experiences_per_category (experiences)

      categories = get_categories(experiences)
      hash_count_for_category = {}
      c = 0
      categories.each do |cat|
        experiences.each do |x|
          if x.adventure.category == cat
            c +=1
            hash_count_for_category[cat] = c
          end
        end
      end
      hash_count_for_category
    end

  end
end


