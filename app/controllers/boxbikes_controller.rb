class BoxbikesController < ApplicationController
  def index
    @boxbikes = Boxbike.all
  end
end
