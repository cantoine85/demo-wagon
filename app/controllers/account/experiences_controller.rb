module Account
  class ExperiencesController < ApplicationController

    def new

    end

    def create

    end

    def index

    end

    def detail
    @alert_message = "#{@experience.title}"
    @experience_coordinates = { lat: @experience.latitude, lng: @experience.longitude }
    end

  end
end
