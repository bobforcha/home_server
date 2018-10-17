class LampsController < ApplicationController
  def index
    @lamps = Lamp.all
  end
end
