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
        @hash_count = hash_experiences_per_category(@experiences)
        @hash_pic = get_last_exp_pic_by_category(@experiences)

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

    def hash_experiences_per_category (experiences)
      categories = get_categories(experiences)
      hash = {}
      categories.each do |cat|
        array = []
        hash[cat] = array
        experiences.each do |x|
          if x.adventure.category == cat
            array << x
            array.sort_by{ |exp| exp.updated_at}
            hash[cat] = array
          end
        end
      end
      hash
    end

    def get_last_exp_pic_by_category(experiences)
      hash = hash_experiences_per_category(experiences)

      categories = get_categories(experiences)
      categories.each do |cat|
        array = hash[cat]
        pic = array.last.adventure.picture.url
        hash[cat] = pic
      end
      hash
    end

  end
end


