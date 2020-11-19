class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    @my_boxes = Boxbike.where(user: current_user)
    @my_reservations = Contract.where(user: current_user)
  end
end
